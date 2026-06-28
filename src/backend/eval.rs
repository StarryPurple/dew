use crate::ir::block::BasicBlock;
use crate::ir::func::Fn;
use crate::ir::instr::*;
use crate::ir::module::Module;
use crate::ir::types::TypeTable;
use crate::value::*;
use std::io::{self, Write, BufRead};

/// Result of evaluating a function body: either a final value, or a tail call
/// to another function (frame already set up for the callee).
enum TailResult {
    Value(Value),
    TailCall(String),
    TailCallDynamic,
}

enum TailInfo {
    Static(String, Vec<Reg>),
    Dynamic(Reg, Vec<Reg>),
}

pub fn run(module: &Module) -> Result<Value, String> {
    let mut runtime = Runtime::new();

    // Execute main, or the first function as entry point
    let result = if let Some(main_fn) = module.fns.iter().find(|f| f.name == "main") {
        let mut frame = EvalFrame::new();
        eval_fn(main_fn, &module.fns, &module.types, &mut frame, &mut runtime)
    } else if let Some(first) = module.fns.first() {
        let mut frame = EvalFrame::new();
        eval_fn(first, &module.fns, &module.types, &mut frame, &mut runtime)
    } else {
        Ok(Value::Unit)
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
    fn get_mut(&mut self, r: usize) -> &mut Value {
        if r >= self.regs.len() { self.regs.resize(r + 1, Value::Unit); }
        &mut self.regs[r]
    }
    fn set(&mut self, r: usize, v: Value) {
        if r >= self.regs.len() { self.regs.resize(r + 1, Value::Unit); }
        self.regs[r] = v;
    }
}

fn eval_fn(
    func: &Fn,
    fns: &[Fn],
    types: &TypeTable,
    frame: &mut EvalFrame,
    runtime: &mut Runtime,
) -> Result<Value, String> {
    let mut current = func;
    loop {
        let entry = current.blocks.first().ok_or("no entry block")?;
        match eval_block(entry, &current.blocks, fns, types, frame, runtime)? {
            TailResult::Value(v) => return Ok(v),
            TailResult::TailCall(name) => {
                current = fns.iter().find(|f| f.name == *name)
                    .ok_or_else(|| format!("fn '{}' not found for tail call", name))?;
                frame.label_stack.clear();
                continue;
            }
            TailResult::TailCallDynamic => {
                let closure_val = frame.regs.first().ok_or("dynamic tail call: empty frame")?.clone();
                let cv = match closure_val {
                    Value::Closure(cv) => cv,
                    _ => return Err("dynamic tail call target is not a closure".into()),
                };
                current = fns.iter().find(|f| f.name == cv.fn_name)
                    .ok_or_else(|| format!("fn '{}' not found for dynamic tail call", cv.fn_name))?;
                let original_param_count = current.params.len() - cv.captures.len();
                let mut new_regs = Vec::new();
                for i in 0..original_param_count {
                    new_regs.push(frame.regs.get(1 + i).cloned().unwrap_or(Value::Unit));
                }
                for cap_val in &cv.captures {
                    new_regs.push(cap_val.clone());
                }
                frame.regs = new_regs;
                frame.label_stack.clear();
                continue;
            }
        }
    }
}

fn find_tail_call(block: &BasicBlock, blocks: &[BasicBlock]) -> Option<TailInfo> {
    let last = block.instrs.last()?;
    let (reg, info) = match last {
        Instr::Call(reg, CallTarget::Static(name), args, _) => {
            (*reg, TailInfo::Static(name.clone(), args.clone()))
        }
        Instr::Call(reg, CallTarget::Dynamic(dyn_reg), args, _) => {
            (*reg, TailInfo::Dynamic(*dyn_reg, args.clone()))
        }
        _ => return None,
    };
    match &block.terminator {
        Terminator::Ret(ret_r) if *ret_r == reg => Some(info),
        Terminator::Jmp(target) => {
            let mut phi_reg = reg;
            let mut label = target.clone();
            loop {
                let next = blocks.iter().find(|b| b.label == label)?;
                let phi_pairs = next.instrs.first().and_then(|i| match i {
                    Instr::Phi(pr, pairs) if pairs.iter().any(|(r, _)| *r == phi_reg) => Some((*pr, pairs)),
                    _ => None,
                });
                match phi_pairs {
                    Some((pr, _pairs)) => {
                        if let Terminator::Ret(ret_r) = &next.terminator {
                            if *ret_r == pr {
                                return Some(info);
                            }
                        }
                        phi_reg = pr;
                        if let Terminator::Jmp(next_label) = &next.terminator {
                            label = next_label.clone();
                            continue;
                        }
                        return None;
                    }
                    None => return None,
                }
            }
        }
        _ => None,
    }
}

fn eval_block(
    block: &BasicBlock,
    blocks: &[BasicBlock],
    fns: &[Fn],
    types: &TypeTable,
    frame: &mut EvalFrame,
    runtime: &mut Runtime,
) -> Result<TailResult, String> {
    let tail_info = find_tail_call(block, blocks);

    if let Some(info) = &tail_info {
        for instr in &block.instrs[..block.instrs.len() - 1] {
            eval_instr(instr, fns, types, frame, runtime)?;
        }
        match info {
            TailInfo::Static(name, args) => {
                let arg_vals: Vec<Value> = args.iter().map(|a| frame.get(*a).clone()).collect();
                frame.regs = arg_vals;
                frame.label_stack.clear();
                return Ok(TailResult::TailCall(name.clone()));
            }
            TailInfo::Dynamic(dyn_reg, args) => {
                let arg_vals: Vec<Value> = args.iter().map(|a| frame.get(*a).clone()).collect();
                let closure_val = frame.get(*dyn_reg).clone();
                frame.regs = vec![closure_val];
                frame.regs.extend(arg_vals);
                frame.label_stack.clear();
                return Ok(TailResult::TailCallDynamic);
            }
        }
    }

    for instr in &block.instrs {
        eval_instr(instr, fns, types, frame, runtime)?;
    }
    match &block.terminator {
        Terminator::Ret(r) => Ok(TailResult::Value(frame.get(*r).clone())),
        Terminator::Br(cond, t, f) => {
            let v = frame.get(*cond).as_bool().unwrap_or(false);
            let target = if v { t } else { f };
            let next = blocks.iter().find(|b| &b.label == target).ok_or("block not found")?;
            frame.label_stack.push(block.label.clone());
            eval_block(next, blocks, fns, types, frame, runtime)
        }
        Terminator::Jmp(target) => {
            let next = blocks.iter().find(|b| &b.label == target).ok_or("block not found")?;
            let target_is_merge = next.instrs.iter().any(|i| matches!(i, Instr::Phi(..)));
            let current_is_merge = block.instrs.iter().any(|i| matches!(i, Instr::Phi(..)));
            if !current_is_merge || target_is_merge {
                frame.label_stack.push(block.label.clone());
            }
            eval_block(next, blocks, fns, types, frame, runtime)
        }
    }
}

fn eval_instr(
    instr: &Instr,
    fns: &[Fn],
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
        Instr::BitAnd(r, a, b) => { let va = frame.get(*a).as_int().unwrap_or(0); let vb = frame.get(*b).as_int().unwrap_or(0); frame.set(*r, Value::Int(va & vb)); }
        Instr::BitOr(r, a, b) => { let va = frame.get(*a).as_int().unwrap_or(0); let vb = frame.get(*b).as_int().unwrap_or(0); frame.set(*r, Value::Int(va | vb)); }
        Instr::BitXor(r, a, b) => { let va = frame.get(*a).as_int().unwrap_or(0); let vb = frame.get(*b).as_int().unwrap_or(0); frame.set(*r, Value::Int(va ^ vb)); }
        Instr::Shl(r, a, b) => { let va = frame.get(*a).as_int().unwrap_or(0); let vb = frame.get(*b).as_int().unwrap_or(0); frame.set(*r, Value::Int(va << vb)); }
        Instr::Shr(r, a, b) => { let va = frame.get(*a).as_int().unwrap_or(0); let vb = frame.get(*b).as_int().unwrap_or(0); frame.set(*r, Value::Int(va >> vb)); }
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
        Instr::ThunkAlloc(r, _name, _ty) => {
            // Allocate a thunk cell in the runtime store, keyed by handle register
            runtime.thunks.insert(*r, ThunkState::Suspended);
            frame.set(*r, Value::Int(0)); // handle register gets a dummy value (real state is in runtime)
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
                    let result = eval_fn(callee, fns, types, &mut callee_frame, runtime)?;
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
                    for (i, arg_reg) in args.iter().enumerate() {
                        callee_frame.set(i, frame.get(*arg_reg).clone());
                    }
                    for (i, cap_val) in closure.captures.iter().enumerate() {
                        callee_frame.set(original_param_count + i, cap_val.clone());
                    }
                    let result = eval_fn(callee, fns, types, &mut callee_frame, runtime)?;
                    frame.set(*r, result);
                }
            }
        }
        Instr::Force(r, handle, _ty) => {
            // handle_register is the thunk handle
            let state = runtime.thunks.get(handle).cloned();
            let result = match state {
                Some(ThunkState::Evaluated(v)) => v,
                Some(ThunkState::Evaluating) => return Err("thunk cycle detected".into()),
                _ => {
                    // Evaluate the thunk — but with register-level thunks, there's no body.
                    // The thunk MUST be updated (via Update) before being forced.
                    // If it's still Suspended, return Unit as fallback.
                    Value::Unit
                }
            };
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
        Instr::StructCons(r, _ty, fields) => {
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
        Instr::StructUpdate(r, base, fidx, val, _, in_place) => {
            let val_val = frame.get(*val).clone();
            if *in_place {
                let mut old = std::mem::replace(frame.get_mut(*base), Value::Unit);
                if let Value::Tuple(ref mut fields) = old {
                    if *fidx < fields.len() {
                        fields[*fidx] = val_val;
                    }
                }
                frame.set(*r, old);
            } else {
                let base_val = frame.get(*base);
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
        Instr::EnumProj(r, _ty, _enum_name, _variant, idx, reg) => {
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
        Instr::ArrayAccess(r, _ty, arr, idx) => {
            if let Value::Array(elems) = frame.get(*arr) {
                let i = frame.get(*idx).as_int().unwrap_or(0) as usize;
                frame.set(*r, elems.get(i).cloned().unwrap_or(Value::Int(0)));
            } else {
                frame.set(*r, Value::Int(0));
            }
        }
        Instr::ArrayUpdate(r, _ty, arr, idx, val, in_place) => {
            let i = frame.get(*idx).as_int().unwrap_or(0) as usize;
            let val_val = frame.get(*val).clone();
            if *in_place {
                let mut old = std::mem::replace(frame.get_mut(*arr), Value::Unit);
                if let Value::Array(ref mut elems) = old {
                    if i < elems.len() {
                        elems[i] = val_val;
                    }
                }
                frame.set(*r, old);
            } else {
                if let Value::Array(elems) = frame.get(*arr) {
                    let mut new_elems = elems.clone();
                    if i < new_elems.len() {
                        new_elems[i] = val_val;
                    }
                    frame.set(*r, Value::Array(new_elems));
                } else {
                    frame.set(*r, val_val);
                }
            }
        }
        Instr::TupleUpdate(r, tup, idx, val, in_place) => {
            let val_val = frame.get(*val).clone();
            if *in_place {
                let mut old = std::mem::replace(frame.get_mut(*tup), Value::Unit);
                if let Value::Tuple(ref mut fields) = old {
                    if *idx < fields.len() {
                        fields[*idx] = val_val;
                    }
                }
                frame.set(*r, old);
            } else {
                if let Value::Tuple(fields) = frame.get(*tup) {
                    let mut new_fields = fields.clone();
                    if *idx < new_fields.len() {
                        new_fields[*idx] = val_val;
                    }
                    frame.set(*r, Value::Tuple(new_fields));
                } else {
                    frame.set(*r, val_val);
                }
            }
        }
        Instr::Move(r, from) => {
            frame.set(*r, frame.get(*from).clone());
        }
        Instr::Update(r, handle, val) => {
            // Store the value into the thunk's runtime state
            let value = frame.get(*val).clone();
            runtime.thunks.insert(*handle, ThunkState::Evaluated(value));
            frame.set(*r, Value::Unit);
        }
        _ => return Err("instruction not implemented in eval".into()),
    }
    Ok(())
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::ir::types::*;

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
