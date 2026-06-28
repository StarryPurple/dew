// Dew IR → LLVM IR translation.
// Based on docs/design/dew-llvm-backend.md (v2 alloca-based design).

use crate::ir::instr::*;
use crate::ir::module::Module;
use crate::ir::thunk::Thunk;
use crate::ir::types::*;
use std::collections::{HashMap, HashSet};
use std::fmt::Write;

pub fn generate(module: &Module) -> Result<String, String> {
    let mut out = String::new();
    let mut ctx = Ctx::new(&module.types);

    writeln!(out, "%Unit = type {{}}").ok();
    writeln!(out, "%thunk = type {{ i64, i64 }}").ok();
    writeln!(out, "@.fmt_int = private constant [4 x i8] c\"%ld\\00\"").ok();
    writeln!(out, "@.fmt_bool = private constant [3 x i8] c\"%s\\00\"").ok();
    writeln!(out, "@.str_true = private constant [5 x i8] c\"true\\00\"").ok();
    writeln!(out, "@.str_false = private constant [6 x i8] c\"false\\00\"").ok();
    writeln!(out, "declare i32 @printf(ptr, ...)").ok();
    writeln!(out, "declare i32 @scanf(ptr, ...)").ok();
    writeln!(out, "declare i32 @putchar(i32)").ok();
    writeln!(out, "declare i32 @getchar()").ok();
    writeln!(out, "declare ptr @malloc(i64)").ok();
    writeln!(out, "declare void @llvm.trap()").ok();
    writeln!(out).ok();

    emit_types(module, &mut ctx, &mut out).map_err(|e| e.to_string())?;

    for t in &module.thunks {
        let safe = t.name.replace('@', "_at_").replace('%', "_pct_");
        writeln!(out, "@{}.cell = global %thunk zeroinitializer", safe).ok();
    }
    writeln!(out).ok();

    for t in &module.thunks {
        emit_thunk(t, module, &mut ctx, &mut out).map_err(|e| e.to_string())?;
    }

    for f in &module.fns {
        if skip_fn(f) { continue; }
        emit_fn(f, module, &mut ctx, &mut out).map_err(|e| e.to_string())?;
    }

    Ok(out)
}

struct Ctx {
    types: HashMap<usize, IrType>,
    enum_names: HashSet<String>,
    is_generic: HashSet<String>,
    is_recursive: HashSet<String>,
    rec_fields: HashSet<(String, usize)>,
    label: usize,
}

impl Ctx {
    fn new(tt: &TypeTable) -> Self {
        let mut enum_names = HashSet::new();
        for e in &tt.enums { enum_names.insert(e.name.clone()); }

        let mut is_generic = HashSet::new();
        let mut is_recursive = HashSet::new();
        let mut rec_fields = HashSet::new();

        for s in &tt.structs {
            if s.name.len() == 1 && s.name.chars().next().map_or(false, |c| c.is_ascii_uppercase()) {
                is_generic.insert(s.name.clone());
            }
            for (fi, (_, ft)) in s.fields.iter().enumerate() {
                if matches!(ft, IrType::Struct(n) | IrType::Enum(n) if n == &s.name) {
                    is_recursive.insert(s.name.clone());
                    rec_fields.insert((s.name.clone(), fi));
                }
            }
        }
        for e in &tt.enums {
            let all_self = e.variants.iter().any(|v|
                v.fields.iter().any(|(_, ft)|
                    matches!(ft, IrType::Struct(n) | IrType::Enum(n) if n == &e.name)));
            if all_self { is_recursive.insert(e.name.clone()); }
        }

        Ctx { types: HashMap::new(), enum_names, is_generic, is_recursive, rec_fields, label: 0 }
    }

    fn set(&mut self, r: usize, ty: IrType) { self.types.insert(r, ty); }

    fn get(&self, r: usize) -> IrType { self.types.get(&r).cloned().unwrap_or(IrType::Int) }

    fn ll(&self, r: usize) -> String { llvm_ty(&self.get(r), &self.rec_fields, &self.is_recursive) }

    fn next(&mut self) -> usize { let n = self.label; self.label += 1; n }
}

fn llvm_ty(ty: &IrType, rec: &HashSet<(String, usize)>, is_rec_type: &HashSet<String>) -> String {
    match ty {
        IrType::Int => "i64".into(),
        IrType::Bool => "i1".into(),
        IrType::Char => "i32".into(),
        IrType::Unit => "%Unit".into(),
        IrType::Struct(n) | IrType::Enum(n) => {
            if is_rec_type.contains(n) { "ptr".into() }
            else { format!("%struct.{}", n) }
        }
        IrType::Array(_, _) => "{ ptr, i64 }".into(),
        IrType::Tuple(ts) => {
            let inner: Vec<String> = ts.iter().filter(|t| **t != IrType::Unit).map(|t| llvm_ty(t, rec, is_rec_type)).collect();
            match inner.len() {
                0 => "i64".into(),
                1 => inner[0].clone(),
                _ => format!("{{ {} }}", inner.join(", ")),
            }
        }
        _ => "i64".into(),
    }
}

fn is_aggregate(ty: &IrType) -> bool {
    matches!(ty, IrType::Struct(_) | IrType::Enum(_) | IrType::Tuple(_) | IrType::Array(_, _))
}

fn is_generic_name(name: &str) -> bool {
    name.len() == 1 && name.chars().next().map_or(false, |c| c.is_ascii_uppercase())
}

fn skip_fn(f: &crate::ir::func::Fn) -> bool {
    if f.name == "main" { return false; }
    if f.return_type == IrType::Unit { return false; }
    // Skip stdlib functions with complex types
    if matches!(&f.return_type, IrType::Tuple(ts) if ts.contains(&IrType::Unit)) { return true; }
    if matches!(&f.return_type, IrType::Struct(_) | IrType::Enum(_)) { return true; }
    // Skip functions with aggregate parameter types (stdlib)
    if f.params.iter().any(|(_, t)| is_aggregate(t)) { return true; }
    false
}

fn has_generic_field(s: &StructDef) -> bool {
    s.fields.iter().any(|(_, t)| matches!(t, IrType::Struct(n) if is_generic_name(n)))
}

// ── Types ──────────────────────────────────────────────────────────

fn emit_types(module: &Module, ctx: &mut Ctx, out: &mut String) -> Result<(), String> {
    let mut emitted = HashSet::new();
    for s in &module.types.structs {
        if ctx.is_generic.contains(&s.name) || is_generic_name(&s.name) || has_generic_field(s) { continue; }
        if !emitted.insert(s.name.clone()) { continue; }
        let fields: Vec<String> = s.fields.iter().enumerate().map(|(fi, (_, ft))| {
            if ctx.rec_fields.contains(&(s.name.clone(), fi)) { "ptr".into() }
            else { llvm_ty(ft, &ctx.rec_fields, &ctx.is_recursive) }
        }).collect();
        writeln!(out, "%struct.{} = type {{ {} }}", s.name, fields.join(", ")).ok();
    }
    for e in &module.types.enums {
        if is_generic_name(&e.name) { continue; }
        if !emitted.insert(e.name.clone()) { continue; }
        let max = e.variants.iter().map(|v| v.fields.iter().map(|(_, t)| elem_size(t)).sum::<i64>()).max().unwrap_or(0);
        let pty = if max > 0 { format!("[{} x i8]", max) } else { String::new() };
        writeln!(out, "%enum.{} = type {{ i64, {} }}", e.name, pty).ok();
    }
    writeln!(out).ok();
    Ok(())
}

fn elem_size(ty: &IrType) -> i64 {
    match ty {
        IrType::Int => 8,
        IrType::Bool => 1,
        IrType::Char => 4,
        IrType::Unit | IrType::Undefined => 0,
        _ => 8,
    }
}

fn oom_check(ptr: &str, out: &mut String, ctx: &mut Ctx) {
    let o = ctx.next();
    let ok = ctx.next();
    writeln!(out, "  %null{} = icmp eq ptr {}, null", o, ptr).ok();
    writeln!(out, "  br i1 %null{}, label %oom{}, label %ok{}", o, o, ok).ok();
    writeln!(out, "oom{}:", o).ok();
    writeln!(out, "  call void @llvm.trap()").ok();
    writeln!(out, "  unreachable").ok();
    writeln!(out, "ok{}:", ok).ok();
}

fn scan(blocks: &[crate::ir::block::BasicBlock], ctx: &mut Ctx) {
    // Pass 1: register types for Call instructions (explicit return type annotation)
    for b in blocks {
        for instr in &b.instrs {
            if let Instr::Call(_, _, _, _) = instr { scan_instr(instr, ctx); }
        }
    }
    // Pass 2: register types for everything except Phi
    for b in blocks {
        for instr in &b.instrs {
            if !matches!(instr, Instr::Call(_, _, _, _) | Instr::Phi(_, _)) { scan_instr(instr, ctx); }
        }
    }
    // Pass 3: register types for Phi (all sources should now be resolved)
    for b in blocks {
        for instr in &b.instrs {
            if let Instr::Phi(_, _) = instr { scan_instr(instr, ctx); }
        }
    }
}

fn scan_instr(instr: &Instr, ctx: &mut Ctx) {
    fn set_reg(instr: &Instr, ctx: &mut Ctx, ty: IrType) {
        ctx.set(result_reg(instr), ty);
    }
    set_reg(instr, ctx, infer_type(instr, ctx));
}

fn result_reg(instr: &Instr) -> usize {
    match instr {
        Instr::Lit(r,_) | Instr::Stdout(r) | Instr::Stdin(r) | Instr::Lambda(r,_,_)
        | Instr::Call(r,_,_,_) | Instr::Force(r,_)
        | Instr::Add(r,_,_) | Instr::Sub(r,_,_) | Instr::Mul(r,_,_) | Instr::Div(r,_,_) | Instr::Rem(r,_,_)
        | Instr::BitAnd(r,_,_) | Instr::BitOr(r,_,_) | Instr::BitXor(r,_,_) | Instr::Shl(r,_,_) | Instr::Shr(r,_,_)
        | Instr::Lt(r,_,_) | Instr::Gt(r,_,_) | Instr::Le(r,_,_) | Instr::Ge(r,_,_) | Instr::Eq(r,_,_) | Instr::Ne(r,_,_)
        | Instr::And(r,_,_) | Instr::Or(r,_,_) | Instr::Not(r,_)
        | Instr::Phi(r,_) | Instr::Fetch(r,_,_) | Instr::Place(r,_,_,_)
        | Instr::Field(r,_,_,_) | Instr::StructCons(r,_,_) | Instr::EnumCons(r,_,_,_)
        | Instr::EnumDisc(r,_) | Instr::EnumProj(r,_,_,_,_,_) | Instr::ArrayLit(r,_,_)
        | Instr::ArrayFill(r,_,_,_) | Instr::TupleLit(r,_,_)
        | Instr::StructUpdate(r,_,_,_,_,_) | Instr::ArrayAccess(r,_,_,_)
        | Instr::ArrayUpdate(r,_,_,_,_,_) | Instr::TupleUpdate(r,_,_,_,_) | Instr::Move(r,_) => *r,
        Instr::Update(_,_) => 0,
    }
}

fn infer_type(instr: &Instr, ctx: &Ctx) -> IrType {
    match instr {
        Instr::Lit(_, lv) => match lv {
            LitValue::Int(_) => IrType::Int,
            LitValue::Bool(_) => IrType::Bool,
            LitValue::Char(_) => IrType::Char,
        },
        Instr::Stdout(_) => IrType::Int,
        Instr::Stdin(_) => IrType::Int,
        Instr::Lambda(_,_,_) => IrType::Undefined,
        Instr::Call(_,_,_,rt) => rt.clone(),
        Instr::Force(_,_) => IrType::Int,
        Instr::Add(..) | Instr::Sub(..) | Instr::Mul(..) | Instr::Div(..) | Instr::Rem(..)
        | Instr::BitAnd(..) | Instr::BitOr(..) | Instr::BitXor(..) | Instr::Shl(..) | Instr::Shr(..) => IrType::Int,
        Instr::Lt(..) | Instr::Gt(..) | Instr::Le(..) | Instr::Ge(..) | Instr::Eq(..) | Instr::Ne(..)
        | Instr::And(..) | Instr::Or(..) | Instr::Not(..) => IrType::Bool,
        Instr::Phi(r, pairs) => {
            pairs.iter().find_map(|(v,_)| ctx.types.get(v)).cloned().unwrap_or(IrType::Int)
        }
        Instr::Fetch(..) | Instr::Place(..) => IrType::Int,
        Instr::Field(_,_,_,ft) => ft.clone(),
        Instr::StructCons(_,ty,_) | Instr::TupleLit(_,ty,_) | Instr::ArrayLit(_,ty,_) | Instr::ArrayFill(_,ty,_,_)
        | Instr::StructUpdate(_,_,_,_,ty,_) | Instr::ArrayAccess(_,ty,_,_) => ty.clone(),
        Instr::EnumCons(_,_,_,_) | Instr::ArrayUpdate(_,_,_,_,_,_) | Instr::TupleUpdate(_,_,_,_,_) => IrType::Undefined,
        Instr::EnumDisc(_,_) => IrType::Int,
        Instr::EnumProj(_,ty,_,_,_,_) => ty.clone(),
        Instr::Move(r, from) => ctx.types.get(from).cloned().unwrap_or(IrType::Int),
        Instr::Update(_,_) => IrType::Int,
    }
}

fn max_reg(blocks: &[crate::ir::block::BasicBlock]) -> usize {
    blocks.iter().flat_map(|b| b.instrs.iter()).map(|i| result_reg(i)).chain(std::iter::once(0)).max().unwrap_or(0)
}

fn emit_allocas(blocks: &[crate::ir::block::BasicBlock], params: &[(usize, IrType)], ctx: &mut Ctx, out: &mut String) {
    let max = max_reg(blocks).max(params.iter().map(|(r,_)| *r).max().unwrap_or(0));
    for r in 0..=max {
        let ty = ctx.get(r);
        if ty == IrType::Unit || ty == IrType::Undefined { continue; }
        let aty = if is_aggregate(&ty) { "ptr".into() } else { llvm_ty(&ty, &ctx.rec_fields, &ctx.is_recursive) };
        writeln!(out, "  %R{} = alloca {}", r, aty).ok();
    }
}

// ── Thunk ──────────────────────────────────────────────────────────

fn emit_thunk(t: &Thunk, _module: &Module, ctx: &mut Ctx, out: &mut String) -> Result<(), String> {
    ctx.label = 0;
    scan(&t.blocks, ctx);
    let rl = ctx.ll(0);
    let safe = t.name.replace('@', "_at_").replace('%', "_pct_");

    writeln!(out, "define {} @force_{}() {{", rl, safe).ok();
    writeln!(out, "entry:").ok();
    writeln!(out, "  %sp = getelementptr %thunk, ptr @{}.cell, i32 0, i32 0", safe).ok();
    writeln!(out, "  %cp = getelementptr %thunk, ptr @{}.cell, i32 0, i32 1", safe).ok();
    writeln!(out, "  %st = load i64, ptr %sp").ok();
    writeln!(out, "  %sus = icmp eq i64 %st, 0").ok();
    writeln!(out, "  br i1 %sus, label %eval, label %chk").ok();
    writeln!(out, "chk:").ok();
    writeln!(out, "  %ev = icmp eq i64 %st, 1").ok();
    writeln!(out, "  br i1 %ev, label %cycle, label %cached").ok();
    writeln!(out, "eval:").ok();
    writeln!(out, "  store i64 1, ptr %sp").ok();
    emit_allocas(&t.blocks, &[], ctx, out);
    for b in &t.blocks {
        if b.label != "entry" { writeln!(out, "{}:", b.label).ok(); }
        for instr in &b.instrs { emit_instr(instr, ctx, out).map_err(|e| e.to_string())?; }
        if let Terminator::Ret(r) = &b.terminator {
            write_cache_val(*r, &safe, out, ctx).map_err(|e| e.to_string())?;
            write_return_from_cache(*r, out, ctx).map_err(|e| e.to_string())?;
        }
    }
    writeln!(out, "cached:").ok();
    write_return_from_cache(0, out, ctx).map_err(|e| e.to_string())?;
    writeln!(out, "cycle:").ok();
    writeln!(out, "  call void @llvm.trap()").ok();
    writeln!(out, "  unreachable").ok();
    writeln!(out, "}}\n").ok();
    Ok(())
}

fn write_cache_val(r: usize, name: &str, out: &mut String, ctx: &mut Ctx) -> Result<(), String> {
    let ty = ctx.get(r);
    match &ty {
        IrType::Bool => writeln!(out, "  %tmp = load i1, ptr %R{}", r).map_err(|e| e.to_string())?,
        IrType::Char => writeln!(out, "  %tmp = load i32, ptr %R{}", r).map_err(|e| e.to_string())?,
        _ if is_aggregate(&ty) => writeln!(out, "  %tmp = load ptr, ptr %R{}", r).map_err(|e| e.to_string())?,
        _ => writeln!(out, "  %tmp = load i64, ptr %R{}", r).map_err(|e| e.to_string())?,
    }
    match &ty {
        IrType::Bool => writeln!(out, "  %cv = zext i1 %tmp to i64").map_err(|e| e.to_string())?,
        IrType::Char => writeln!(out, "  %cv = zext i32 %tmp to i64").map_err(|e| e.to_string())?,
        _ if is_aggregate(&ty) => writeln!(out, "  %cv = ptrtoint ptr %tmp to i64").map_err(|e| e.to_string())?,
        _ => writeln!(out, "  %cv = add i64 %tmp, 0").map_err(|e| e.to_string())?,
    }
    writeln!(out, "  %vp = getelementptr %thunk, ptr @{}.cell, i32 0, i32 1", name).map_err(|e| e.to_string())?;
    writeln!(out, "  store i64 %cv, ptr %vp").map_err(|e| e.to_string())?;
    writeln!(out, "  store i64 2, ptr %sp").map_err(|e| e.to_string())?;
    Ok(())
}

fn write_return_from_cache(r: usize, out: &mut String, ctx: &mut Ctx) -> Result<(), String> {
    let ty = ctx.get(r);
    let rl = ctx.ll(r);
    let cv = ctx.next();
    let rv = ctx.next();
    if rl == "void" || rl == "%Unit" {
        writeln!(out, "  ret void").map_err(|e| e.to_string())?;
    } else if is_aggregate(&ty) {
        writeln!(out, "  %ci{} = load i64, ptr %cp", cv).map_err(|e| e.to_string())?;
        writeln!(out, "  %rv{} = inttoptr i64 %ci{} to ptr", rv, cv).map_err(|e| e.to_string())?;
        writeln!(out, "  ret ptr %rv{}", rv).map_err(|e| e.to_string())?;
    } else if rl == "i1" {
        writeln!(out, "  %ci{} = load i64, ptr %cp", cv).map_err(|e| e.to_string())?;
        writeln!(out, "  %rv{} = trunc i64 %ci{} to i1", rv, cv).map_err(|e| e.to_string())?;
        writeln!(out, "  ret i1 %rv{}", rv).map_err(|e| e.to_string())?;
    } else if rl == "i32" {
        writeln!(out, "  %ci{} = load i64, ptr %cp", cv).map_err(|e| e.to_string())?;
        writeln!(out, "  %rv{} = trunc i64 %ci{} to i32", rv, cv).map_err(|e| e.to_string())?;
        writeln!(out, "  ret i32 %rv{}", rv).map_err(|e| e.to_string())?;
    } else {
        writeln!(out, "  %rv{} = load i64, ptr %cp", rv).map_err(|e| e.to_string())?;
        writeln!(out, "  ret i64 %rv{}", rv).map_err(|e| e.to_string())?;
    }
    Ok(())
}

// ── Function ───────────────────────────────────────────────────────

fn emit_fn(f: &crate::ir::func::Fn, _module: &Module, ctx: &mut Ctx, out: &mut String) -> Result<(), String> {
    ctx.label = 0;
    scan(&f.blocks, ctx);

    for (r, t) in &f.params { ctx.set(*r, t.clone()); }

    let rl = if f.name == "main" {
        "i64".into()
    } else if f.return_type == IrType::Unit {
        "void".into()
    } else {
        llvm_ty(&f.return_type, &ctx.rec_fields, &ctx.is_recursive)
    };
    let params: Vec<String> = f.params.iter().map(|(r, t)| {
        let ll: String = if is_aggregate(t) { "ptr".into() } else if *t == IrType::Bool { "i1".into() } else if *t == IrType::Char { "i32".into() } else { "i64".into() };
        format!("{} %arg{}", ll, r)
    }).collect();

    writeln!(out, "define {} @{}({}) {{", rl, f.name, params.join(", ")).ok();

    for (bi, b) in f.blocks.iter().enumerate() {
        writeln!(out, "{}:", b.label).ok();
        if bi == 0 {
            emit_allocas(&f.blocks, &f.params, ctx, out);
            for (r, t) in &f.params {
                let ll = if is_aggregate(t) { "ptr".to_string() } else if *t == IrType::Bool { "i1".into() } else if *t == IrType::Char { "i32".into() } else { "i64".into() };
                writeln!(out, "  store {} %arg{}, ptr %R{}", ll, r, r).map_err(|e| e.to_string())?;
            }
        }
        for instr in &b.instrs { emit_instr(instr, ctx, out).map_err(|e| e.to_string())?; }
        emit_terminator(&b.terminator, &rl, ctx, out).map_err(|e| e.to_string())?;
    }
    writeln!(out, "}}\n").ok();
    Ok(())
}

// ── Instructions ───────────────────────────────────────────────────

fn emit_instr(instr: &Instr, ctx: &mut Ctx, out: &mut String) -> Result<(), String> {
    match instr {
        Instr::Lit(r, lv) => emit_lit(*r, lv, ctx, out),
        Instr::Stdout(r) => emit_stdout(*r, ctx, out),
        Instr::Stdin(r) => emit_stdin(*r, ctx, out),
        Instr::Add(r,a,b) => emit_bin(*r,*a,*b,"add","i64",ctx,out),
        Instr::Sub(r,a,b) => emit_bin(*r,*a,*b,"sub","i64",ctx,out),
        Instr::Mul(r,a,b) => emit_bin(*r,*a,*b,"mul","i64",ctx,out),
        Instr::Div(r,a,b) => emit_bin(*r,*a,*b,"sdiv","i64",ctx,out),
        Instr::Rem(r,a,b) => emit_bin(*r,*a,*b,"srem","i64",ctx,out),
        Instr::Lt(r,a,b) => emit_ic(*r,*a,*b,"slt",ctx,out),
        Instr::Gt(r,a,b) => emit_ic(*r,*a,*b,"sgt",ctx,out),
        Instr::Le(r,a,b) => emit_ic(*r,*a,*b,"sle",ctx,out),
        Instr::Ge(r,a,b) => emit_ic(*r,*a,*b,"sge",ctx,out),
        Instr::Eq(r,a,b) => emit_ic(*r,*a,*b,"eq",ctx,out),
        Instr::Ne(r,a,b) => emit_ic(*r,*a,*b,"ne",ctx,out),
        Instr::And(r,a,b) => emit_bin(*r,*a,*b,"and","i1",ctx,out),
        Instr::Or(r,a,b) => emit_bin(*r,*a,*b,"or","i1",ctx,out),
        Instr::Not(r,a) => emit_not(*r,*a,ctx,out),
        Instr::Phi(r,pairs) => emit_phi(*r, pairs, ctx, out),
        Instr::Call(r,target,args,_) => emit_call(*r, target, args, ctx, out),
        Instr::Force(r,target) => emit_force(*r, target, ctx, out),
        Instr::Field(r,base,idx,_) => emit_field(*r,*base,*idx,ctx,out),
        Instr::StructCons(r,_,fields) => emit_struct_cons(*r,fields,ctx,out),
        Instr::StructUpdate(r,base,fidx,val,_,_) => emit_struct_update(*r,*base,*fidx,*val,ctx,out),
        Instr::EnumCons(r,ename,variant,fields) => emit_enum_cons(*r,ename,variant,fields,ctx,out),
        Instr::EnumDisc(r,reg) => emit_enum_disc(*r,*reg,ctx,out),
        Instr::EnumProj(r,_,_ename,_variant,idx,reg) => emit_enum_proj(*r,*idx,*reg,ctx,out),
        Instr::ArrayLit(r,_,elems) => emit_array_lit(*r,elems,ctx,out),
        Instr::ArrayFill(r,_,val,n) => emit_array_fill(*r,*val,*n,ctx,out),
        Instr::ArrayAccess(r,_,arr,idx) => emit_array_access(*r,*arr,*idx,ctx,out),
        Instr::ArrayUpdate(r,_,arr,idx,val,_) => emit_array_update(*r,*arr,*idx,*val,ctx,out),
        Instr::TupleLit(r,_,elems) => emit_tuple_lit(*r,elems,ctx,out),
        Instr::TupleUpdate(r,tup,idx,val,_) => emit_tuple_update(*r,*tup,*idx,*val,ctx,out),
        Instr::Move(r,from) => emit_move(*r,*from,ctx,out),
        Instr::Update(_,_) => Ok(()),  // no-op for LLVM
        _ => { writeln!(out, "  ;; skip {:?}", instr).map_err(|e| e.to_string()) }
    }
}

fn emit_lit(r: usize, v: &LitValue, _ctx: &mut Ctx, out: &mut String) -> Result<(), String> {
    match v {
        LitValue::Int(n) => writeln!(out, "  store i64 {}, ptr %R{}", n, r),
        LitValue::Bool(true) => writeln!(out, "  store i1 true, ptr %R{}", r),
        LitValue::Bool(false) => writeln!(out, "  store i1 false, ptr %R{}", r),
        LitValue::Char(c) => writeln!(out, "  store i32 {}, ptr %R{}", *c as i32, r),
    }.map_err(|e| e.to_string())
}

fn emit_stdout(r: usize, ctx: &mut Ctx, out: &mut String) -> Result<(), String> {
    let ty = ctx.get(r);
    let c = ctx.next();
    let ll = ctx.ll(r);
    if ll == "%Unit" { return Ok(()); }
    writeln!(out, "  %v{} = load {}, ptr %R{}", c, ll, r).map_err(|e| e.to_string()).map_err(|e| e.to_string())?;
    match &ty {
        IrType::Int => writeln!(out, "  call i32 (ptr, ...) @printf(ptr @.fmt_int, i64 %v{})", c),
        IrType::Bool => {
            writeln!(out, "  %s{} = select i1 %v{}, ptr @.str_true, ptr @.str_false", c, c).map_err(|e| e.to_string()).map_err(|e| e.to_string())?;
            writeln!(out, "  call i32 (ptr, ...) @printf(ptr @.fmt_bool, ptr %s{})", c)
        }
        IrType::Char => writeln!(out, "  call i32 @putchar(i32 %v{})", c),
        _ => Ok(()),
    }.map_err(|e| e.to_string())
}

fn emit_stdin(_r: usize, _ctx: &mut Ctx, _out: &mut String) -> Result<(), String> { Ok(()) }

fn emit_bin(r: usize, a: usize, b: usize, op: &str, ll: &str, ctx: &mut Ctx, out: &mut String) -> Result<(), String> {
    let ca = ctx.next();
    let cb = ctx.next();
    let cv = ctx.next();
    writeln!(out, "  %va{} = load {}, ptr %R{}", ca, ll, a).ok();
    writeln!(out, "  %vb{} = load {}, ptr %R{}", cb, ll, b).ok();
    writeln!(out, "  %v{} = {} {} %va{}, %vb{}", cv, op, ll, ca, cb).ok();
    writeln!(out, "  store {} %v{}, ptr %R{}", ll, cv, r).ok();
    Ok(())
}

fn emit_ic(r: usize, a: usize, b: usize, cond: &str, ctx: &mut Ctx, out: &mut String) -> Result<(), String> {
    let ca = ctx.next();
    let cb = ctx.next();
    let cv = ctx.next();
    writeln!(out, "  %va{} = load i64, ptr %R{}", ca, a).ok();
    writeln!(out, "  %vb{} = load i64, ptr %R{}", cb, b).ok();
    writeln!(out, "  %v{} = icmp {} i64 %va{}, %vb{}", cv, cond, ca, cb).ok();
    writeln!(out, "  store i1 %v{}, ptr %R{}", cv, r).ok();
    Ok(())
}

fn emit_not(r: usize, a: usize, ctx: &mut Ctx, out: &mut String) -> Result<(), String> {
    writeln!(out, "  %va = load i1, ptr %R{}", a).map_err(|e| e.to_string()).map_err(|e| e.to_string())?;
    writeln!(out, "  %v{} = xor i1 %va, true", ctx.next()).map_err(|e| e.to_string()).map_err(|e| e.to_string())?;
    writeln!(out, "  store i1 %v{}, ptr %R{}", ctx.next()-1, r).map_err(|e| e.to_string())
}

fn emit_phi(r: usize, pairs: &[(usize, String)], ctx: &mut Ctx, out: &mut String) -> Result<(), String> {
    let ty = ctx.get(r);
    let alloca_ll = if is_aggregate(&ty) { "ptr".into() } else { ctx.ll(r) };
    // LLVM phi requires SSA values from predecessor blocks. Since emit_phi runs
    // in the merge block (not predecessors), we can't put loads there.
    // Instead: phi on alloca addresses (all ptr), then load after phi.
    let inc: Vec<String> = pairs.iter().map(|(v, l)| format!("%R{}, %{}", v, l)).collect();
    let cv = ctx.next();
    let pv = ctx.next();
    writeln!(out, "  %p{} = phi ptr [{}]", cv, inc.join("], [")).ok();
    writeln!(out, "  %v{} = load {}, ptr %p{}", pv, alloca_ll, cv).ok();
    writeln!(out, "  store {} %v{}, ptr %R{}", alloca_ll, pv, r).ok();
    Ok(())
}

fn emit_call(r: usize, target: &CallTarget, args: &[usize], ctx: &mut Ctx, out: &mut String) -> Result<(), String> {
    match target {
        CallTarget::Static(name) => {
            let mut av = Vec::new();
            for (i, a) in args.iter().enumerate() {
                let li = ctx.next();
                let ll = ctx.ll(*a);
                let _ = writeln!(out, "  %a{} = load {}, ptr %R{}", li, ll, a);
                av.push(format!("{} %a{}", ll, li));
            }
            let ci = ctx.next();
            let rl = ctx.ll(r);
            let _ = writeln!(out, "  %c{} = call {} @{}({})", ci, rl, name, av.join(", "));
            if rl != "void" && rl != "%Unit" {
                let _ = writeln!(out, "  store {} %c{}, ptr %R{}", rl, ci, r);
            }
        }
        CallTarget::Dynamic(_) => { let _ = writeln!(out, "  ;; dynamic call"); }
    }
    Ok(())
}

fn emit_force(r: usize, target: &ForceTarget, ctx: &mut Ctx, out: &mut String) -> Result<(), String> {
    match target {
        ForceTarget::Static(name) => {
            let safe = name.replace('@', "_at_").replace('%', "_pct_");
            let rl = ctx.ll(r);
            writeln!(out, "  %f{} = call i64 @force_{}()", ctx.next(), safe).map_err(|e| e.to_string()).map_err(|e| e.to_string())?;
            let c = ctx.next() - 1;
            match rl.as_str() {
                "i1" => {
                    writeln!(out, "  %tmp = trunc i64 %f{} to i1", c).map_err(|e| e.to_string()).map_err(|e| e.to_string())?;
                    writeln!(out, "  store i1 %tmp, ptr %R{}", r).map_err(|e| e.to_string())
                }
                "i32" => {
                    writeln!(out, "  %tmp = trunc i64 %f{} to i32", c).map_err(|e| e.to_string()).map_err(|e| e.to_string())?;
                    writeln!(out, "  store i32 %tmp, ptr %R{}", r).map_err(|e| e.to_string())
                }
                "i64" => writeln!(out, "  store i64 %f{}, ptr %R{}", c, r).map_err(|e| e.to_string()),
                _ if is_aggregate(&ctx.get(r)) => {
                    writeln!(out, "  %tmp = inttoptr i64 %f{} to ptr", c).map_err(|e| e.to_string()).map_err(|e| e.to_string())?;
                    writeln!(out, "  store ptr %tmp, ptr %R{}", r).map_err(|e| e.to_string())
                }
                _ => Ok(()),
            }
        }
        ForceTarget::Dynamic(_) => writeln!(out, "  ;; dynamic force").map_err(|e| e.to_string()),
    }
}

fn emit_field(r: usize, base: usize, idx: usize, ctx: &mut Ctx, out: &mut String) -> Result<(), String> {
    let pl = ctx.next();
    let fl = ctx.next();
    let vl = ctx.next();
    let rl = ctx.ll(base);
    let _ = writeln!(out, "  %p{} = load ptr, ptr %R{}", pl, base);
    if rl.starts_with('%') {
        let _ = writeln!(out, "  %f{} = getelementptr inbounds {}, ptr %p{}, i32 0, i32 {}", fl, rl, pl, idx);
    } else {
        let _ = writeln!(out, "  %f{} = getelementptr i64, ptr %p{}, i32 {}", fl, pl, idx);
    }
    let out_ll = ctx.ll(r);
    let _ = writeln!(out, "  %v{} = load {}, ptr %f{}", vl, out_ll, fl);
    let _ = writeln!(out, "  store {} %v{}, ptr %R{}", out_ll, vl, r);
    Ok(())
}

fn emit_struct_cons(r: usize, fields: &[usize], ctx: &mut Ctx, out: &mut String) -> Result<(), String> {
    let n = fields.len();
    let pn = ctx.next();
    let _ = writeln!(out, "  %p{} = call ptr @malloc(i64 {})", pn, (n * 8) as i64);
    let _ = writeln!(out, "  %n{} = icmp eq ptr %p{}, null", pn, pn);
    let oom_l = ctx.next();
    let ok_l = ctx.next();
    let _ = writeln!(out, "  br i1 %n{}, label %oom{}, label %ok{}", pn, oom_l, ok_l);
    let _ = writeln!(out, "oom{}:", oom_l);
    let _ = writeln!(out, "  call void @llvm.trap()");
    let _ = writeln!(out, "  unreachable");
    let _ = writeln!(out, "ok{}:", ok_l);
    for (i, f) in fields.iter().enumerate() {
        let fi = ctx.next();
        let vi = ctx.next();
        let ft = ctx.ll(*f);
        let _ = writeln!(out, "  %f{} = getelementptr {}, ptr %p{}, i32 {}", fi, ft, pn, i);
        let _ = writeln!(out, "  %v{} = load {}, ptr %R{}", vi, ft, f);
        let _ = writeln!(out, "  store {} %v{}, ptr %f{}", ft, vi, fi);
    }
    let _ = writeln!(out, "  store ptr %p{}, ptr %R{}", pn, r);
    Ok(())
}

fn emit_struct_update(r: usize, base: usize, fidx: usize, val: usize, ctx: &mut Ctx, out: &mut String) -> Result<(), String> {
    let bn = ctx.next();
    let fn_ = ctx.next();
    let vn = ctx.next();
    let _ = writeln!(out, "  %b{} = load ptr, ptr %R{}", bn, base);
    let ft = ctx.ll(val);
    let _ = writeln!(out, "  %f{} = getelementptr {}, ptr %b{}, i32 {}", fn_, ft, bn, fidx);
    let _ = writeln!(out, "  %v{} = load {}, ptr %R{}", vn, ft, val);
    let _ = writeln!(out, "  store {} %v{}, ptr %f{}", ft, vn, fn_);
    let _ = writeln!(out, "  store ptr %b{}, ptr %R{}", bn, r);
    Ok(())
}

fn emit_enum_cons(r: usize, _ename: &str, _variant: &str, fields: &[usize], ctx: &mut Ctx, out: &mut String) -> Result<(), String> {
    let pn = ctx.next();
    let _ = writeln!(out, "  %p{} = call ptr @malloc(i64 16)", pn);
    let _ = writeln!(out, "  %n{} = icmp eq ptr %p{}, null", pn, pn);
    let oom_l = ctx.next();
    let ok_l = ctx.next();
    let _ = writeln!(out, "  br i1 %n{}, label %oom{}, label %ok{}", pn, oom_l, ok_l);
    let _ = writeln!(out, "oom{}:", oom_l);
    let _ = writeln!(out, "  call void @llvm.trap()");
    let _ = writeln!(out, "  unreachable");
    let _ = writeln!(out, "ok{}:", ok_l);
    let tn = ctx.next();
    let _ = writeln!(out, "  %t{} = getelementptr i64, ptr %p{}, i32 0", tn, pn);
    let _ = writeln!(out, "  store i64 0, ptr %t{}", tn);
    if let Some(f) = fields.first() {
        let p2 = ctx.next();
        let pc = ctx.next();
        let _ = writeln!(out, "  %p{} = getelementptr i8, ptr %p{}, i32 8", p2, pn);
        let _ = writeln!(out, "  %c{} = bitcast ptr %p{} to ptr", pc, p2);
        let _ = writeln!(out, "  %v{} = load i64, ptr %R{}", ctx.next(), f);
        let _ = writeln!(out, "  store i64 %v{}, ptr %c{}", ctx.next()-1, pc);
    }
    let _ = writeln!(out, "  store ptr %p{}, ptr %R{}", pn, r);
    Ok(())
}

fn emit_enum_disc(r: usize, reg: usize, ctx: &mut Ctx, out: &mut String) -> Result<(), String> {
    let pn = ctx.next();
    let tn = ctx.next();
    let _ = writeln!(out, "  %p{} = load ptr, ptr %R{}", pn, reg);
    let _ = writeln!(out, "  %t{} = getelementptr i64, ptr %p{}, i32 0", tn, pn);
    let _ = writeln!(out, "  %v{} = load i64, ptr %t{}", ctx.next(), tn);
    let _ = writeln!(out, "  store i64 %v{}, ptr %R{}", ctx.next()-1, r);
    Ok(())
}

fn emit_enum_proj(r: usize, idx: usize, reg: usize, ctx: &mut Ctx, out: &mut String) -> Result<(), String> {
    let pn = ctx.next();
    let _ = writeln!(out, "  %p{} = load ptr, ptr %R{}", pn, reg);
    let pp = ctx.next();
    let pc = ctx.next();
    let _ = writeln!(out, "  %p{} = getelementptr i8, ptr %p{}, i32 8", pp, pn);
    let _ = writeln!(out, "  %c{} = bitcast ptr %p{} to ptr", pc, pp);
    let ft = ctx.ll(r);
    let fn_ = ctx.next();
    let _ = writeln!(out, "  %f{} = getelementptr {}, ptr %c{}, i32 {}", fn_, ft, pc, idx);
    let _ = writeln!(out, "  %v{} = load {}, ptr %f{}", ctx.next(), ft, fn_);
    let _ = writeln!(out, "  store {} %v{}, ptr %R{}", ft, ctx.next()-1, r);
    Ok(())
}

fn emit_array_lit(r: usize, elems: &[usize], ctx: &mut Ctx, out: &mut String) -> Result<(), String> {
    let n = elems.len();
    let ne = n as i64;
    let mn = ctx.next();
    let dn = ctx.next();
    let _ = writeln!(out, "  %m{} = call ptr @malloc(i64 16)", mn);
    let _ = writeln!(out, "  %n{} = icmp eq ptr %m{}, null", mn, mn);
    let oom_l = ctx.next();
    let ok_l = ctx.next();
    let _ = writeln!(out, "  br i1 %n{}, label %oom{}, label %ok{}", mn, oom_l, ok_l);
    let _ = writeln!(out, "oom{}:", oom_l);
    let _ = writeln!(out, "  call void @llvm.trap()");
    let _ = writeln!(out, "  unreachable");
    let _ = writeln!(out, "ok{}:", ok_l);
    let _ = writeln!(out, "  %d{} = call ptr @malloc(i64 {})", dn, ne * 8);
    let fp = ctx.next();
    let _ = writeln!(out, "  %f{} = getelementptr ptr, ptr %m{}, i32 0", fp, mn);
    let _ = writeln!(out, "  store ptr %d{}, ptr %f{}", dn, fp);
    let fl = ctx.next();
    let _ = writeln!(out, "  %f{} = getelementptr i64, ptr %m{}, i32 1", fl, mn);
    let _ = writeln!(out, "  store i64 {}, ptr %f{}", n, fl);
    for (i, e) in elems.iter().enumerate() {
        let ei = ctx.next();
        let vi = ctx.next();
        let ft = ctx.ll(*e);
        let _ = writeln!(out, "  %g{} = getelementptr {}, ptr %d{}, i32 {}", ei, ft, dn, i);
        let _ = writeln!(out, "  %w{} = load {}, ptr %R{}", vi, ft, e);
        let _ = writeln!(out, "  store {} %w{}, ptr %g{}", ft, vi, ei);
    }
    let _ = writeln!(out, "  store ptr %m{}, ptr %R{}", mn, r);
    Ok(())
}

fn emit_array_fill(r: usize, val: usize, n: usize, ctx: &mut Ctx, out: &mut String) -> Result<(), String> {
    let ne = n as i64;
    let dn = ctx.next();
    let mn = ctx.next();
    let _ = writeln!(out, "  %m{} = call ptr @malloc(i64 16)", mn);
    let _ = writeln!(out, "  %k{} = icmp eq ptr %m{}, null", mn, mn);
    let oom_l = ctx.next();
    let ok_l = ctx.next();
    let _ = writeln!(out, "  br i1 %k{}, label %oom{}, label %ok{}", mn, oom_l, ok_l);
    let _ = writeln!(out, "oom{}:", oom_l);
    let _ = writeln!(out, "  call void @llvm.trap()");
    let _ = writeln!(out, "  unreachable");
    let _ = writeln!(out, "ok{}:", ok_l);
    let _ = writeln!(out, "  %d{} = call ptr @malloc(i64 {})", dn, ne * 8);
    let fp = ctx.next();
    let _ = writeln!(out, "  %f{} = getelementptr ptr, ptr %m{}, i32 0", fp, mn);
    let _ = writeln!(out, "  store ptr %d{}, ptr %f{}", dn, fp);
    let fl = ctx.next();
    let _ = writeln!(out, "  %f{} = getelementptr i64, ptr %m{}, i32 1", fl, mn);
    let _ = writeln!(out, "  store i64 {}, ptr %f{}", n, fl);
    let vv = ctx.next();
    let _ = writeln!(out, "  %w{} = load i64, ptr %R{}", vv, val);
    let in_v = ctx.next();
    let loop_l = ctx.next();
    let done_l = ctx.next();
    let body_l = ctx.next();
    let _ = writeln!(out, "  %iv{} = alloca i64", in_v);
    let _ = writeln!(out, "  store i64 0, ptr %iv{}", in_v);
    let _ = writeln!(out, "  br label %L{}", loop_l);
    let _ = writeln!(out, "L{}:", loop_l);
    let _ = writeln!(out, "  %ci{} = load i64, ptr %iv{}", ctx.next(), in_v);
    let _ = writeln!(out, "  %fi{} = icmp eq i64 %ci{}, {}", ctx.next(), ctx.next()-1, n);
    let _ = writeln!(out, "  br i1 %fi{}, label %L{}, label %L{}", ctx.next()-2, done_l, body_l);
    let _ = writeln!(out, "L{}:", body_l);
    let ep = ctx.next();
    let _ = writeln!(out, "  %ep{} = getelementptr i64, ptr %d{}, i64 %ci{}", ep, dn, ctx.next()-7);
    let _ = writeln!(out, "  store i64 %w{}, ptr %ep{}", vv, ep);
    let _ = writeln!(out, "  %ni{} = add i64 %ci{}, 1", ctx.next(), ctx.next()-10);
    let _ = writeln!(out, "  store i64 %ni{}, ptr %iv{}", ctx.next()-1, in_v);
    let _ = writeln!(out, "  br label %L{}", loop_l);
    let _ = writeln!(out, "L{}:", done_l);
    let _ = writeln!(out, "  store ptr %m{}, ptr %R{}", mn, r);
    Ok(())
}

fn emit_array_access(r: usize, arr: usize, idx: usize, ctx: &mut Ctx, out: &mut String) -> Result<(), String> {
    let mp = ctx.next();
    let fdp = ctx.next();
    let dp = ctx.next();
    let iv = ctx.next();
    let ep = ctx.next();
    let vn = ctx.next();
    let _ = writeln!(out, "  %m{} = load ptr, ptr %R{}", mp, arr);
    let _ = writeln!(out, "  %f{} = getelementptr ptr, ptr %m{}, i32 0", fdp, mp);
    let _ = writeln!(out, "  %d{} = load ptr, ptr %f{}", dp, fdp);
    let _ = writeln!(out, "  %i{} = load i64, ptr %R{}", iv, idx);
    let ft = ctx.ll(r);
    let _ = writeln!(out, "  %e{} = getelementptr {}, ptr %d{}, i64 %i{}", ep, ft, dp, iv);
    let _ = writeln!(out, "  %w{} = load {}, ptr %e{}", vn, ft, ep);
    let _ = writeln!(out, "  store {} %w{}, ptr %R{}", ft, vn, r);
    Ok(())
}

fn emit_array_update(r: usize, arr: usize, idx: usize, val: usize, ctx: &mut Ctx, out: &mut String) -> Result<(), String> {
    let mp = ctx.next();
    let fdp = ctx.next();
    let dp = ctx.next();
    let iv = ctx.next();
    let ep = ctx.next();
    let vn = ctx.next();
    let _ = writeln!(out, "  %m{} = load ptr, ptr %R{}", mp, arr);
    let _ = writeln!(out, "  %f{} = getelementptr ptr, ptr %m{}, i32 0", fdp, mp);
    let _ = writeln!(out, "  %d{} = load ptr, ptr %f{}", dp, fdp);
    let _ = writeln!(out, "  %i{} = load i64, ptr %R{}", iv, idx);
    let ft = ctx.ll(val);
    let _ = writeln!(out, "  %e{} = getelementptr {}, ptr %d{}, i64 %i{}", ep, ft, dp, iv);
    let _ = writeln!(out, "  %w{} = load {}, ptr %R{}", vn, ft, val);
    let _ = writeln!(out, "  store {} %w{}, ptr %e{}", ft, vn, ep);
    let _ = writeln!(out, "  store ptr %m{}, ptr %R{}", mp, r);
    Ok(())
}

fn emit_tuple_lit(r: usize, elems: &[usize], ctx: &mut Ctx, out: &mut String) -> Result<(), String> {
    let n = elems.len();
    let pn = ctx.next();
    let _ = writeln!(out, "  %p{} = call ptr @malloc(i64 {})", pn, (n * 8) as i64);
    let _ = writeln!(out, "  %z{} = icmp eq ptr %p{}, null", pn, pn);
    let oom_l = ctx.next();
    let ok_l = ctx.next();
    let _ = writeln!(out, "  br i1 %z{}, label %oom{}, label %ok{}", pn, oom_l, ok_l);
    let _ = writeln!(out, "oom{}:", oom_l);
    let _ = writeln!(out, "  call void @llvm.trap()");
    let _ = writeln!(out, "  unreachable");
    let _ = writeln!(out, "ok{}:", ok_l);
    for (i, e) in elems.iter().enumerate() {
        let fi = ctx.next();
        let vi = ctx.next();
        let ft = ctx.ll(*e);
        let _ = writeln!(out, "  %f{} = getelementptr {}, ptr %p{}, i32 {}", fi, ft, pn, i);
        let _ = writeln!(out, "  %w{} = load {}, ptr %R{}", vi, ft, e);
        let _ = writeln!(out, "  store {} %w{}, ptr %f{}", ft, vi, fi);
    }
    let _ = writeln!(out, "  store ptr %p{}, ptr %R{}", pn, r);
    Ok(())
}

fn emit_tuple_update(r: usize, tup: usize, idx: usize, val: usize, ctx: &mut Ctx, out: &mut String) -> Result<(), String> {
    let tn = ctx.next();
    let fn_ = ctx.next();
    let vn = ctx.next();
    let _ = writeln!(out, "  %t{} = load ptr, ptr %R{}", tn, tup);
    let ft = ctx.ll(val);
    let _ = writeln!(out, "  %f{} = getelementptr {}, ptr %t{}, i32 {}", fn_, ft, tn, idx);
    let _ = writeln!(out, "  %v{} = load {}, ptr %R{}", vn, ft, val);
    let _ = writeln!(out, "  store {} %v{}, ptr %f{}", ft, vn, fn_);
    let _ = writeln!(out, "  store ptr %t{}, ptr %R{}", tn, r);
    Ok(())
}

fn emit_move(r: usize, from: usize, ctx: &Ctx, out: &mut String) -> Result<(), String> {
    let ft = ctx.ll(from);
    let _ = writeln!(out, "  %v = load {}, ptr %R{}", ft, from);
    let _ = writeln!(out, "  store {} %v, ptr %R{}", ft, r);
    Ok(())
}

fn emit_terminator(term: &Terminator, ret_ll: &str, ctx: &mut Ctx, out: &mut String) -> Result<(), String> {
    match term {
        Terminator::Ret(r) => {
            let rl = ctx.ll(*r);
            // Use the function's declared return type, not the register type
            if ret_ll == "void" || ret_ll == "%Unit" {
                let _ = writeln!(out, "  ret void");
            } else {
                let vl = ctx.next();
                let _ = writeln!(out, "  %v{} = load {}, ptr %R{}", vl, rl, r);
                if ret_ll != rl.as_str() {
                    let _ = writeln!(out, "  %v{}_c = bitcast {} %v{} to {}", vl, rl, vl, ret_ll);
                    let _ = writeln!(out, "  ret {} %v{}_c", ret_ll, vl);
                } else {
                    let _ = writeln!(out, "  ret {} %v{}", rl, vl);
                }
            }
        }
        Terminator::Br(cond, t, f) => {
            let _ = writeln!(out, "  %c = load i1, ptr %R{}", cond);
            let _ = writeln!(out, "  br i1 %c, label %{}, label %{}", t, f);
        }
        Terminator::Jmp(l) => {
            let _ = writeln!(out, "  br label %{}", l);
        }
    }
    Ok(())
}
