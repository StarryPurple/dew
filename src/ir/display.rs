use super::block::BasicBlock;
use super::func::Fn;
use super::instr::*;
use super::module::Module;
use super::thunk::Thunk;
use super::types::*;

pub fn display(module: &Module) -> String {
    let mut out = String::new();

    for s in &module.types.structs {
        out.push_str(&format!("struct {} {{\n", s.name));
        for (name, ty) in &s.fields {
            out.push_str(&format!("  {}: {},\n", name, ty.display()));
        }
        out.push_str("}\n\n");
    }

    for e in &module.types.enums {
        out.push_str(&format!("enum {} {{\n", e.name));
        for v in &e.variants {
            if v.fields.is_empty() {
                out.push_str(&format!("  {},\n", v.name));
            } else if v.fields.len() == 1 && v.fields[0].0.is_empty() {
                out.push_str(&format!("  {}({}),\n", v.name, v.fields[0].1.display()));
            } else {
                out.push_str(&format!("  {} {{\n", v.name));
                for (fname, fty) in &v.fields {
                    out.push_str(&format!("    {}: {},\n", fname, fty.display()));
                }
                out.push_str("  },\n");
            }
        }
        out.push_str("}\n\n");
    }

    for f in &module.fns {
        out.push_str(&display_fn(f));
        out.push('\n');
    }
    for t in &module.thunks {
        out.push_str(&display_thunk(t));
        out.push('\n');
    }
    out
}

fn display_fn(f: &Fn) -> String {
    let params: Vec<String> = f.params.iter()
        .map(|(r, t)| format!("%{}: {}", r, t.display()))
        .collect();
    let mut out = format!("fn @{}({}) {{\n", f.name, params.join(", "));
    for block in &f.blocks {
        out.push_str(&format!("  {}:\n", block.label));
        for instr in &block.instrs {
            out.push_str(&format!("    {}\n", display_instr(instr, &f.return_type)));
        }
        out.push_str(&format!("    {}\n", display_terminator(&block.terminator)));
    }
    out.push_str("}\n");
    out
}

fn display_thunk(t: &Thunk) -> String {
    let mut out = format!("thunk @{}() {{\n", t.name);
    for block in &t.blocks {
        out.push_str(&format!("  {}:\n", block.label));
        for instr in &block.instrs {
            out.push_str(&format!("    {}\n", display_instr(instr, &t.result_type)));
        }
        out.push_str(&format!("    {}\n", display_terminator(&block.terminator)));
    }
    out.push_str("}\n");
    out
}

fn instr_type(instr: &Instr, return_ty: &IrType) -> IrType {
    match instr {
        Instr::Lit(_, v) => match v {
            LitValue::Int(_) => IrType::Int,
            LitValue::Bool(_) => IrType::Bool,
            LitValue::Char(_) => IrType::Char,
        },
        Instr::Add(..) | Instr::Sub(..) | Instr::Mul(..) | Instr::Div(..) | Instr::Rem(..) => IrType::Int,
        Instr::BitAnd(..) | Instr::BitOr(..) | Instr::BitXor(..) | Instr::Shl(..) | Instr::Shr(..) => IrType::Int,
        Instr::Lt(..) | Instr::Gt(..) | Instr::Le(..) | Instr::Ge(..) | Instr::Eq(..) | Instr::Ne(..) => IrType::Bool,
        Instr::And(..) | Instr::Or(..) | Instr::Not(..) => IrType::Bool,
        Instr::Field(_, _, _, field_ty) => field_ty.clone(),
        Instr::Call(_, _, _, ret_ty) => ret_ty.clone(),
        Instr::Force(_, _) => return_ty.clone(),
        Instr::ArrayLit(_, ty, _) => ty.clone(),
        Instr::ArrayFill(_, ty, _, _) => ty.clone(),
        Instr::TupleLit(_, ty, _) => ty.clone(),
        Instr::StructCons(_, ty, _) => ty.clone(),
        Instr::EnumCons(_, enum_name, _, _) => IrType::Enum(enum_name.clone()),
        Instr::EnumDisc(..) => IrType::Int,
        Instr::EnumProj(..) => IrType::Undefined,
        Instr::StructUpdate(_, _, _, _, struct_ty) => struct_ty.clone(),
        Instr::ArrayAccess(_, ty, _, _) | Instr::ArrayUpdate(_, ty, _, _, _) => ty.clone(),
        Instr::TupleUpdate(..) => IrType::Int,
        Instr::Move(..) | Instr::Update(..) | Instr::Fetch(..) | Instr::Place(..) => IrType::Undefined,
        Instr::Lambda(..) => IrType::Undefined,
        Instr::Phi(..) => return_ty.clone(),
        Instr::Stdout(_) => IrType::Int,
        Instr::Stdin(_) => IrType::Int,
    }
}

fn display_instr(instr: &Instr, return_ty: &IrType) -> String {
    let result_ty = instr_type(instr, return_ty);
    match instr {
        Instr::Lit(r, v) => format!("%{}: {} = lit {}", r, result_ty, display_lit(v)),
        Instr::Stdout(r) => format!("stdout{} %{}", result_ty, r),
        Instr::Stdin(r) => format!("%{}: {} = stdin", r, result_ty),
        Instr::Lambda(r, name, caps) => {
            format!("%{}: {} = lambda @{}({})", r, result_ty, name,
                caps.iter().map(|c| format!("%{}", c)).collect::<Vec<_>>().join(", "))
        }
        Instr::Call(r, target, args, _ret_ty) => {
            let t = match target {
                CallTarget::Static(n) => format!("@{}", n),
                CallTarget::Dynamic(reg) => format!("%{}", reg),
            };
            format!("%{}: {} = call {} {}", r, result_ty, t,
                args.iter().map(|a| format!("%{}", a)).collect::<Vec<_>>().join(" "))
        }
        Instr::Force(r, target) => {
            let t = match target {
                ForceTarget::Static(n) => format!("@{}", n),
                ForceTarget::Dynamic(reg) => format!("%{}", reg),
            };
            format!("%{}: {} = force {}", r, result_ty, t)
        }
        Instr::Add(r, a, b) => format!("%{}: {} = add %{} %{}", r, result_ty, a, b),
        Instr::Sub(r, a, b) => format!("%{}: {} = sub %{} %{}", r, result_ty, a, b),
        Instr::Mul(r, a, b) => format!("%{}: {} = mul %{} %{}", r, result_ty, a, b),
        Instr::Div(r, a, b) => format!("%{}: {} = div %{} %{}", r, result_ty, a, b),
        Instr::Rem(r, a, b) => format!("%{}: {} = rem %{} %{}", r, result_ty, a, b),
        Instr::BitAnd(r, a, b) => format!("%{}: {} = and %{} %{}", r, result_ty, a, b),
        Instr::BitOr(r, a, b) => format!("%{}: {} = or %{} %{}", r, result_ty, a, b),
        Instr::BitXor(r, a, b) => format!("%{}: {} = xor %{} %{}", r, result_ty, a, b),
        Instr::Shl(r, a, b) => format!("%{}: {} = shl %{} %{}", r, result_ty, a, b),
        Instr::Shr(r, a, b) => format!("%{}: {} = shr %{} %{}", r, result_ty, a, b),
        Instr::Lt(r, a, b) => format!("%{}: {} = lt %{} %{}", r, result_ty, a, b),
        Instr::Gt(r, a, b) => format!("%{}: {} = gt %{} %{}", r, result_ty, a, b),
        Instr::Le(r, a, b) => format!("%{}: {} = le %{} %{}", r, result_ty, a, b),
        Instr::Ge(r, a, b) => format!("%{}: {} = ge %{} %{}", r, result_ty, a, b),
        Instr::Eq(r, a, b) => format!("%{}: {} = eq %{} %{}", r, result_ty, a, b),
        Instr::Ne(r, a, b) => format!("%{}: {} = ne %{} %{}", r, result_ty, a, b),
        Instr::And(r, a, b) => format!("%{}: {} = and %{} %{}", r, result_ty, a, b),
        Instr::Or(r, a, b) => format!("%{}: {} = or %{} %{}", r, result_ty, a, b),
        Instr::Not(r, a) => format!("%{}: {} = not %{}", r, result_ty, a),
        Instr::Phi(r, pairs) => {
            let p: Vec<String> = pairs.iter()
                .map(|(v, l)| format!("%{} {}", v, l))
                .collect();
            format!("%{} = phi [{}]", r, p.join("] ["))
        }
        Instr::Fetch(r, base, path) => {
            format!("%{}: {} = fetch %{} {}", r, result_ty, base, display_path(path, true))
        }
        Instr::Place(r, base, path, val) => {
            format!("%{}: {} = place %{} {} = %{}", r, result_ty, base, display_path(path, false), val)
        }
        Instr::Field(r, base, name, _field_ty) => format!("%{}: {} = field %{} .{}", r, result_ty, base, name),
        Instr::StructCons(r, ty, fields) => {
            let type_str = match ty {
                IrType::Struct(n) => format!("@{}", n),
                _ => String::new(),
            };
            format!("%{}: {} = struct_cons {} {}", r, result_ty, type_str,
                fields.iter().map(|f| format!("%{}", f)).collect::<Vec<_>>().join(" "))
        }
        Instr::EnumCons(r, enum_name, variant, fields) => {
            format!("%{}: {} = enum_cons @{}::{} {}", r, result_ty, enum_name, variant,
                fields.iter().map(|f| format!("%{}", f)).collect::<Vec<_>>().join(" "))
        }
        Instr::EnumDisc(r, e) => format!("%{}: {} = enum_disc %{}", r, result_ty, e),
        Instr::EnumProj(r, enum_name, variant, idx, e) => {
            format!("%{}: {} = enum_proj @{}::{}[{}] %{}", r, result_ty, enum_name, variant, idx, e)
        }
        Instr::ArrayLit(r, _ty, elems) => {
            format!("%{}: {} = array_lit {}", r, result_ty,
                elems.iter().map(|e| format!("%{}", e)).collect::<Vec<_>>().join(" "))
        }
        Instr::ArrayFill(r, _ty, val, n) => {
            format!("%{}: {} = array_fill %{} {}", r, result_ty, val, n)
        }
        Instr::TupleLit(r, _ty, elems) => {
            format!("%{}: {} = tuple_lit {}", r, result_ty,
                elems.iter().map(|e| format!("%{}", e)).collect::<Vec<_>>().join(" "))
        }
        Instr::StructUpdate(r, base, field, val, _struct_ty) => {
            format!("%{}: {} = struct_update %{} .{} = %{}", r, result_ty, base, field, val)
        }
        Instr::ArrayAccess(r, _ty, arr, idx) => format!("%{}: {} = array_access %{} %{}", r, result_ty, arr, idx),
        Instr::ArrayUpdate(r, _ty, arr, idx, val) => {
            format!("%{}: {} = array_update %{} %{} %{}", r, result_ty, arr, idx, val)
        }
        Instr::TupleUpdate(r, tup, idx, val) => {
            format!("%{}: {} = tuple_update %{} .{} = %{}", r, result_ty, tup, idx, val)
        }
        Instr::Move(r, from) => format!("%{}: {} = move %{}", r, result_ty, from),
        Instr::Update(r, target) => {
            let t = match target {
                ForceTarget::Static(n) => format!("@{}", n),
                ForceTarget::Dynamic(reg) => format!("%{}", reg),
            };
            format!("%{}: {} = update {}", r, result_ty, t)
        }
    }
}

fn display_lit(v: &LitValue) -> String {
    match v {
        LitValue::Int(n) => n.to_string(),
        LitValue::Bool(b) => if *b { "true".into() } else { "false".into() },
        LitValue::Char(c) => format!("'{}'", c),
    }
}

fn display_path(path: &[Accessor], for_fetch: bool) -> String {
    path.iter().map(|a| match a {
        Accessor::Field(n) => format!(".{}", n),
        Accessor::Index(r) => format!("%[{}]", r),
        Accessor::TupleIndex(i) => format!(".{}", i),
    }).collect::<Vec<_>>().join(" ")
}

fn display_terminator(t: &Terminator) -> String {
    match t {
        Terminator::Ret(r) => format!("ret %{}", r),
        Terminator::Br(cond, t, f) => format!("br %{} {} {}", cond, t, f),
        Terminator::Jmp(l) => format!("jmp {}", l),
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn display_simple_fn() {
        let mut f = Fn::new("add".into(), vec![(0, IrType::Int), (1, IrType::Int)], IrType::Int);
        let mut block = BasicBlock::new("entry".into());
        block.instrs.push(Instr::Add(0, 0, 1));
        block.terminator = Terminator::Ret(0);
        f.blocks.push(block);
        let output = display_fn(&f);
        assert!(output.contains("fn @add"));
        assert!(output.contains("add %0 %1"));
        assert!(output.contains("ret %0"));
    }

    #[test]
    fn display_thunk_val() {
        let mut t = Thunk::new("x".into(), IrType::Int);
        let mut block = BasicBlock::new("entry".into());
        block.instrs.push(Instr::Lit(0, LitValue::Int(42)));
        block.terminator = Terminator::Ret(0);
        t.blocks.push(block);
        let output = display_thunk(&t);
        assert!(output.contains("thunk @x"));
        assert!(output.contains("lit 42"));
        assert!(output.contains("ret %0"));
    }
}
