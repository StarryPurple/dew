use crate::ir::block::BasicBlock;
use crate::ir::func::Fn;
use crate::ir::instr::*;
use crate::ir::module::Module;
use crate::ir::thunk::Thunk;
use crate::ir::types::TypeTable;
use crate::value::*;
use std::collections::HashMap;
use std::io::{self, Write, BufRead};

pub fn run(module: &Module) -> Result<Value, String> {
    let mut runtime = Runtime::new();

    // Execute main
    let result = if let Some(main_fn) = module.fns.iter().find(|f| f.name == "main") {
        let mut frame = EvalFrame::new();
        eval_fn(main_fn, &module.fns, &module.thunks, &module.types, &mut frame, &mut runtime)
    } else if let Some(main_thunk) = module.thunks.iter().find(|t| t.name == "main") {
        let mut frame = EvalFrame::new();
        force_thunk(main_thunk, &module.fns, &module.thunks, &module.types, &mut frame, &mut runtime)
    } else {
        // Evaluate first thunk as default
        if let Some(first) = module.thunks.first() {
            let mut frame = EvalFrame::new();
            force_thunk(first, &module.fns, &module.thunks, &module.types, &mut frame, &mut runtime)
        } else {
            Ok(Value::Unit)
        }
    };
    eprintln!("\nProgram dew-IR successfully interpreted.");
    result
}

pub struct EvalFrame {
    regs: Vec<Value>,
    label_stack: Vec<String>,
}

impl EvalFrame {
    pub fn new() -> Self { EvalFrame { regs: Vec::new(), label_stack: Vec::new() } }
    fn get(&self, r: usize) -> &Value { self.regs.get(r).unwrap_or(&Value::Unit) }
    fn set(&mut self, r: usize, v: Value) {
        if r >= self.regs.len() { self.regs.resize(r + 1, Value::Unit); }
        self.regs[r] = v;
    }
}

fn eval_fn(
    func: &Fn,
    fns: &[Fn],
    thunks: &[Thunk],
    types: &TypeTable,
    frame: &mut EvalFrame,
    runtime: &mut Runtime,
) -> Result<Value, String> {
    let entry = func.blocks.first().ok_or("no entry block")?;
    eval_block(entry, &func.blocks, fns, thunks, types, frame, runtime)
}

fn eval_block(
    block: &BasicBlock,
    blocks: &[BasicBlock],
    fns: &[Fn],
    thunks: &[Thunk],
    types: &TypeTable,
    frame: &mut EvalFrame,
    runtime: &mut Runtime,
) -> Result<Value, String> {
    for instr in &block.instrs {
        eval_instr(instr, fns, thunks, types, frame, runtime)?;
    }
    match &block.terminator {
        Terminator::Ret(r) => Ok(frame.get(*r).clone()),
        Terminator::Br(cond, t, f) => {
            let v = frame.get(*cond).as_bool().unwrap_or(false);
            let target = if v { t } else { f };
            let next = blocks.iter().find(|b| &b.label == target).ok_or("block not found")?;
            frame.label_stack.push(block.label.clone());
            eval_block(next, blocks, fns, thunks, types, frame, runtime)
        }
        Terminator::Jmp(target) => {
            let next = blocks.iter().find(|b| &b.label == target).ok_or("block not found")?;
            let is_merge = block.instrs.iter().any(|i| matches!(i, Instr::Phi(..)));
            if !is_merge {
                frame.label_stack.push(block.label.clone());
            }
            eval_block(next, blocks, fns, thunks, types, frame, runtime)
        }
    }
}

fn eval_instr(
    instr: &Instr,
    fns: &[Fn],
    thunks: &[Thunk],
    types: &TypeTable,
    frame: &mut EvalFrame,
    runtime: &mut Runtime,
) -> Result<(), String> {
    match instr {
        Instr::Lit(r, v) => {
            let val = match v {
                LitValue::Int(n) => Value::Int(*n),
                LitValue::Bool(b) => Value::Bool(*b),
                LitValue::Char(c) => Value::Char(*c),
            };
            frame.set(*r, val);
        }
        Instr::Add(r, a, b) => {
            let va = frame.get(*a).as_int().unwrap_or(0);
            let vb = frame.get(*b).as_int().unwrap_or(0);
            frame.set(*r, Value::Int(va.wrapping_add(vb)));
        }
        Instr::Sub(r, a, b) => {
            let va = frame.get(*a).as_int().unwrap_or(0);
            let vb = frame.get(*b).as_int().unwrap_or(0);
            frame.set(*r, Value::Int(va.wrapping_sub(vb)));
        }
        Instr::Mul(r, a, b) => {
            let va = frame.get(*a).as_int().unwrap_or(0);
            let vb = frame.get(*b).as_int().unwrap_or(0);
            frame.set(*r, Value::Int(va.wrapping_mul(vb)));
        }
        Instr::Div(r, a, b) => {
            let va = frame.get(*a).as_int().unwrap_or(0);
            let vb = frame.get(*b).as_int().unwrap_or(0);
            if vb == 0 { return Err("division by zero".into()); }
            frame.set(*r, Value::Int(va / vb));
        }
        Instr::Rem(r, a, b) => {
            let va = frame.get(*a).as_int().unwrap_or(0);
            let vb = frame.get(*b).as_int().unwrap_or(0);
            if vb == 0 { return Err("division by zero".into()); }
            frame.set(*r, Value::Int(va % vb));
        }
        Instr::Lt(r, a, b) => {
            let va = frame.get(*a).compare_key().unwrap_or(0);
            let vb = frame.get(*b).compare_key().unwrap_or(0);
            frame.set(*r, Value::Bool(va < vb));
        }
        Instr::Gt(r, a, b) => {
            let va = frame.get(*a).compare_key().unwrap_or(0);
            let vb = frame.get(*b).compare_key().unwrap_or(0);
            frame.set(*r, Value::Bool(va > vb));
        }
        Instr::Le(r, a, b) => {
            let va = frame.get(*a).as_int().unwrap_or(0);
            let vb = frame.get(*b).as_int().unwrap_or(0);
            frame.set(*r, Value::Bool(va <= vb));
        }
        Instr::Lambda(r, fn_name, captures) => {
            let mut cap_values = Vec::new();
            for cap_reg in captures {
                cap_values.push(frame.get(*cap_reg).clone());
            }
            frame.set(*r, Value::Closure(ClosureValue {
                fn_name: fn_name.clone(),
                captures: cap_values,
            }));
        }
        Instr::Ge(r, a, b) => {
            let va = frame.get(*a).compare_key().unwrap_or(0);
            let vb = frame.get(*b).compare_key().unwrap_or(0);
            frame.set(*r, Value::Bool(va >= vb));
        }
        Instr::Eq(r, a, b) => {
            let va = frame.get(*a).compare_key().unwrap_or(0);
            let vb = frame.get(*b).compare_key().unwrap_or(0);
            frame.set(*r, Value::Bool(va == vb));
        }
        Instr::Ne(r, a, b) => {
            let va = frame.get(*a).compare_key().unwrap_or(0);
            let vb = frame.get(*b).compare_key().unwrap_or(0);
            frame.set(*r, Value::Bool(va != vb));
        }
        Instr::And(r, a, b) => {
            let va = frame.get(*a).as_bool().unwrap_or(false);
            let vb = frame.get(*b).as_bool().unwrap_or(false);
            frame.set(*r, Value::Bool(va && vb));
        }
        Instr::Or(r, a, b) => {
            let va = frame.get(*a).as_bool().unwrap_or(false);
            let vb = frame.get(*b).as_bool().unwrap_or(false);
            frame.set(*r, Value::Bool(va || vb));
        }
        Instr::Not(r, a) => {
            let va = frame.get(*a).as_bool().unwrap_or(false);
            frame.set(*r, Value::Bool(!va));
        }
        Instr::Call(r, target, args, ..) => {
            match target {
                CallTarget::Static(name) => {
                    let callee = fns.iter().find(|f| &f.name == name).ok_or("fn not found")?;
                    let mut callee_frame = EvalFrame::new();
                    for (i, arg_reg) in args.iter().enumerate() {
                        callee_frame.set(i, frame.get(*arg_reg).clone());
                    }
                    let result = eval_fn(callee, fns, thunks, types, &mut callee_frame, runtime)?;
                    frame.set(*r, result);
                }
                CallTarget::Dynamic(reg) => {
                    let closure = match frame.get(*reg) {
                        Value::Closure(cv) => cv.clone(),
                        _ => return Err("dynamic call target is not a closure".into()),
                    };
                    let callee = fns.iter().find(|f| f.name == closure.fn_name)
                        .ok_or(format!("closure fn '{}' not found", closure.fn_name))?;
                    let mut callee_frame = EvalFrame::new();
                    let original_param_count = callee.params.len() - closure.captures.len();
                    // Set call arguments (original params)
                    for (i, arg_reg) in args.iter().enumerate() {
                        callee_frame.set(i, frame.get(*arg_reg).clone());
                    }
                    // Set captured values after original params
                    for (i, cap_val) in closure.captures.iter().enumerate() {
                        callee_frame.set(original_param_count + i, cap_val.clone());
                    }
                    let result = eval_fn(callee, fns, thunks, types, &mut callee_frame, runtime)?;
                    frame.set(*r, result);
                }
            }
        }
        Instr::Force(r, target) => {
            let name = match target {
                ForceTarget::Static(n) => n.clone(),
                ForceTarget::Dynamic(_) => return Err("dynamic force not yet supported".into()),
            };
            let thunk = thunks.iter().find(|t| t.name == name).ok_or("thunk not found")?;
            let result = force_thunk(thunk, fns, thunks, types, frame, runtime)?;
            frame.set(*r, result);
        }
        Instr::Stdout(r) => {
            let val = frame.get(*r);
            match val {
                Value::Int(n) => print!("{}", n),
                Value::Bool(b) => print!("{}", if *b { "true" } else { "false" }),
                Value::Char(c) => print!("{}", c),
                _ => {}
            }
            io::stdout().flush().ok();
        }
        Instr::Stdin(r) => {
            let mut line = String::new();
            io::stdin().lock().read_line(&mut line).ok();
            let trimmed = line.trim();
            let val = if let Ok(n) = trimmed.parse::<i64>() {
                Value::Int(n)
            } else {
                Value::Int(0)
            };
            frame.set(*r, val);
        }
        Instr::Phi(r, pairs) => {
            let val = frame.label_stack.pop()
                .and_then(|pred| {
                    pairs.iter().find(|(_, l)| l == &pred)
                        .map(|(reg, _)| frame.get(*reg).clone())
                })
                .unwrap_or_else(|| {
                    pairs.first().map(|(reg, _)| frame.get(*reg).clone())
                        .unwrap_or(Value::Int(0))
                });
            frame.set(*r, val);
        }
        Instr::StructCons(r, _name, fields) => {
            let values: Vec<Value> = fields.iter().map(|f| frame.get(*f).clone()).collect();
            frame.set(*r, Value::Tuple(values));
        }
        Instr::Field(r, obj, idx, ..) => {
            let obj_val = frame.get(*obj);
            if let Value::Tuple(fields) = obj_val {
                let field_val = fields.get(*idx).cloned().unwrap_or(Value::Int(0));
                frame.set(*r, field_val);
            } else {
                frame.set(*r, Value::Int(0));
            }
        }
        Instr::StructUpdate(r, base, fidx, val, ..) => {
            let base_val = frame.get(*base);
            let val_val = frame.get(*val).clone();
            if let Value::Tuple(fields) = base_val {
                let mut new_fields = fields.clone();
                if *fidx < new_fields.len() {
                    new_fields[*fidx] = val_val;
                }
                frame.set(*r, Value::Tuple(new_fields));
            } else {
                frame.set(*r, val_val);
            }
        }
        Instr::EnumCons(r, enum_name, variant, fields) => {
            let values: Vec<Value> = fields.iter().map(|f| frame.get(*f).clone()).collect();
            let tag = types.enum_variant_tag(enum_name, variant).unwrap_or(0);
            frame.set(*r, Value::Enum(enum_name.clone(), variant.clone(), tag, values));
        }
        Instr::EnumDisc(r, reg) => {
            let val = frame.get(*reg);
            if let Value::Enum(_, _, tag, _) = val {
                frame.set(*r, Value::Int(*tag as i64));
            } else {
                frame.set(*r, Value::Int(0));
            }
        }
        Instr::EnumProj(r, _enum_name, _variant, idx, reg) => {
            let val = frame.get(*reg);
            if let Value::Enum(_, _, _tag, fields) = val {
                if *idx < fields.len() {
                    frame.set(*r, fields[*idx].clone());
                } else {
                    frame.set(*r, Value::Unit);
                }
            } else {
                frame.set(*r, Value::Unit);
            }
        }
        Instr::ArrayLit(r, _ty, elems) => {
            let values: Vec<Value> = elems.iter().map(|e| frame.get(*e).clone()).collect();
            frame.set(*r, Value::Array(values));
        }
        Instr::ArrayFill(r, _ty, val, n) => {
            let v = frame.get(*val).clone();
            frame.set(*r, Value::Array(vec![v; *n]));
        }
        Instr::ArrayAccess(r, arr, idx) => {
            if let Value::Array(elems) = frame.get(*arr) {
                let i = frame.get(*idx).as_int().unwrap_or(0) as usize;
                frame.set(*r, elems.get(i).cloned().unwrap_or(Value::Int(0)));
            } else {
                frame.set(*r, Value::Int(0));
            }
        }
        Instr::ArrayUpdate(r, arr, idx, val) => {
            if let Value::Array(elems) = frame.get(*arr) {
                let mut new_elems = elems.clone();
                let i = frame.get(*idx).as_int().unwrap_or(0) as usize;
                if i < new_elems.len() {
                    new_elems[i] = frame.get(*val).clone();
                }
                frame.set(*r, Value::Array(new_elems));
            } else {
                frame.set(*r, frame.get(*val).clone());
            }
        }
        _ => return Err("instruction not implemented in eval".into()),
    }
    Ok(())
}

fn force_thunk(
    thunk: &Thunk,
    fns: &[Fn],
    thunks: &[Thunk],
    types: &TypeTable,
    frame: &mut EvalFrame,
    runtime: &mut Runtime,
) -> Result<Value, String> {
    let state = runtime.thunks.get(&thunk.name).cloned();
    match state {
        Some(ThunkState::Evaluated(v)) => Ok(v),
        Some(ThunkState::Evaluating) => Err("thunk cycle detected".into()),
        _ => {
            runtime.thunks.insert(thunk.name.clone(), ThunkState::Evaluating);
            let entry = thunk.blocks.first().ok_or("no entry block")?;
            let mut thunk_frame = EvalFrame::new();
            let result = eval_block(entry, &thunk.blocks, fns, thunks, types, &mut thunk_frame, runtime)?;
            runtime.thunks.insert(thunk.name.clone(), ThunkState::Evaluated(result.clone()));
            Ok(result)
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::ir::types::*;

    #[test]
    fn eval_simple_thunk() {
        let mut module = Module::new();
        let mut t = Thunk::new("x".into(), IrType::Int);
        let mut block = BasicBlock::new("entry".into());
        block.instrs.push(Instr::Lit(0, LitValue::Int(42)));
        block.terminator = Terminator::Ret(0);
        t.blocks.push(block);
        module.thunks.push(t);
        let result = run(&module).unwrap();
        assert_eq!(result.as_int(), Some(42));
    }

    #[test]
    fn eval_add_fn() {
        let mut module = Module::new();
        let mut f = Fn::new("add".into(), vec![(0, IrType::Int), (1, IrType::Int)], IrType::Int);
        let mut block = BasicBlock::new("entry".into());
        block.instrs.push(Instr::Add(2, 0, 1));
        block.terminator = Terminator::Ret(2);
        f.blocks.push(block);
        module.fns.push(f);

        let mut main = Fn::new("main".into(), vec![], IrType::Unit);
        let mut mblock = BasicBlock::new("entry".into());
        mblock.instrs.push(Instr::Lit(0, LitValue::Int(40)));
        mblock.instrs.push(Instr::Lit(1, LitValue::Int(2)));
        mblock.instrs.push(Instr::Call(2, CallTarget::Static("add".into()), vec![0, 1], IrType::Int));
        mblock.instrs.push(Instr::Stdout(2));
        mblock.terminator = Terminator::Ret(2);
        main.blocks.push(mblock);
        module.fns.push(main);

        let result = run(&module).unwrap();
        assert_eq!(result.as_int(), Some(42));
    }
}
