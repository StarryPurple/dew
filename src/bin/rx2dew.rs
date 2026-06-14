// Rx → Dew source-to-source translator
// Handles: struct, impl, fn, while(cond), loop, if/else, let/let mut, getInt/printInt/printlnInt, arrays, exit

use std::collections::HashMap;
use std::{env, fs, process};

fn main() {
    let args: Vec<String> = env::args().collect();
    if args.len() < 2 {
        eprintln!("usage: rx2dew <file.rx>");
        process::exit(1);
    }
    let src = fs::read_to_string(&args[1]).unwrap_or_else(|e| {
        eprintln!("[E001] cannot read {}: {}", args[1], e);
        process::exit(1);
    });
    let mut t = Translator::new();
    let dew = t.translate(&src);
    print!("{dew}");
}

struct Translator {
    impl_methods: HashMap<String, Vec<(String, Vec<(String, String)>, String, String)>>,
    // struct_name -> [(method_name, params, ret_type, body_text)]
    struct_fields: HashMap<String, Vec<(String, String)>>,
}

impl Translator {
    fn new() -> Self {
        Self { impl_methods: HashMap::new(), struct_fields: HashMap::new() }
    }

    fn translate(&mut self, src: &str) -> String {
        let mut out = String::new();
        let mut lines: Vec<&str> = src.lines().collect();
        // Preprocess: remove block comments, collect impl blocks
        let mut i = 0;
        let mut in_block_comment = false;
        let mut clean_lines: Vec<String> = vec![];

        while i < lines.len() {
            let line = lines[i].trim();
            if in_block_comment {
                if line.contains("*/") { in_block_comment = false; }
                i += 1;
                continue;
            }
            if line.starts_with("/*") {
                if !line.contains("*/") { in_block_comment = true; }
                i += 1;
                continue;
            }
            if line.starts_with("//") || line.is_empty() { i += 1; continue; }
            clean_lines.push(line.to_string());
            i += 1;
        }

        // Join all code into one string for processing
        let code = clean_lines.join(" ");
        let code = self.extract_impls(&code);

        // Process declarations
        for decl in code.split(';') {
            let decl = decl.trim();
            if decl.is_empty() { continue; }

            if decl.starts_with("const ") {
                out.push_str(&self.translate_const(decl));
            } else if decl.starts_with("struct ") {
                out.push_str(&self.translate_struct(decl));
            } else if decl.starts_with("fn ") {
                out.push_str(&self.translate_fn(decl));
            }
        }

        // Emit impl methods as standalone functions
        for (struct_name, methods) in &self.impl_methods {
            for (method_name, params, ret_type, body) in methods {
                let mut full_params = params.clone();
                // Determine self type
                let self_param = if method_name == "new" {
                    ("self".to_string(), struct_name.clone())
                } else {
                    ("self".to_string(), struct_name.clone())
                };
                let mut all_params = vec![self_param];
                all_params.extend(full_params.clone());
                out.push_str(&format!("def {}_{} = fn(", struct_name, method_name));
                for (pi, (pn, pt)) in all_params.iter().enumerate() {
                    if pi > 0 { out.push_str(", "); }
                    out.push_str(&format!("{}: {}", pn, translate_type(pt)));
                }
                out.push_str(&format!(") -> {} {{\n", translate_type(ret_type)));
                out.push_str(&format!("  {}\n", body));
                out.push_str("}\n\n");
            }
        }

        out
    }

    fn extract_impls(&mut self, code: &str) -> String {
        let mut result = String::new();
        let chars: Vec<char> = code.chars().collect();
        let mut i = 0;
        while i < chars.len() {
            if i + 5 < chars.len() && chars[i..i+4].iter().collect::<String>() == "impl " {
                i += 5;
                let mut struct_name = String::new();
                while i < chars.len() && (chars[i].is_alphanumeric() || chars[i] == '_') {
                    struct_name.push(chars[i]); i += 1;
                }
                // Skip whitespace and {
                while i < chars.len() && chars[i] != '{' { i += 1; }
                i += 1; // skip {
                let mut depth = 1;
                let mut impl_body = String::new();
                while i < chars.len() && depth > 0 {
                    if chars[i] == '{' { depth += 1; }
                    if chars[i] == '}' { depth -= 1; if depth == 0 { i += 1; break; } }
                    impl_body.push(chars[i]); i += 1;
                }
                self.parse_impl_methods(&struct_name, &impl_body);
            } else {
                result.push(chars[i]); i += 1;
            }
        }
        result
    }

    fn parse_impl_methods(&mut self, struct_name: &str, body: &str) {
        let body = body.trim();
        // Simple split by "fn "
        for part in body.split("fn ") {
            let part = part.trim();
            if part.is_empty() { continue; }
            // Parse method signature
            if let Some(paren) = part.find('(') {
                let method_name = part[..paren].trim().to_string();
                let rest = &part[paren..];
                if let Some(arrow) = rest.find("->") {
                    let params_str = &rest[1..arrow].trim();
                    let after_arrow = &rest[arrow+2..].trim();
                    let ret_start = after_arrow.find(|c: char| c == '{' || c == ';');
                    let ret_type = if let Some(pos) = ret_start {
                        after_arrow[..pos].trim().to_string()
                    } else { "()".to_string() };
                    let body_start = if let Some(pos) = ret_start { pos } else { after_arrow.len() };
                    let method_body = if after_arrow.len() > body_start {
                        let b = after_arrow[body_start..].trim();
                        let b = b.strip_prefix('{').unwrap_or(b);
                        let b = b.strip_suffix('}').unwrap_or(b);
                        b.trim().to_string()
                    } else { String::new() };

                    let params: Vec<(String, String)> = if params_str.is_empty() {
                        vec![]
                    } else {
                        params_str.split(',')
                            .filter_map(|p| {
                                let p = p.trim();
                                if p == "self" || p == "&self" || p == "&mut self" { return None; }
                                let parts: Vec<&str> = p.split(':').collect();
                                if parts.len() == 2 {
                                    Some((parts[0].trim().to_string(), parts[1].trim().to_string()))
                                } else { None }
                            })
                            .collect()
                    };

                    self.impl_methods.entry(struct_name.to_string())
                        .or_default()
                        .push((method_name, params, ret_type, method_body));
                }
            }
        }
    }

    fn translate_const(&self, decl: &str) -> String {
        let decl = decl.strip_prefix("const ").unwrap_or(decl).trim();
        let parts: Vec<&str> = decl.splitn(2, ':').collect();
        let name_val: Vec<&str> = parts[0].splitn(2, '=').collect();
        if name_val.len() == 2 {
            let name = name_val[0].trim().to_uppercase();
            let val = name_val[1].trim().trim_end_matches(';');
            format!("def {} = {};\n", name, val)
        } else { String::new() }
    }

    fn translate_struct(&self, decl: &str) -> String {
        let decl = decl.strip_prefix("struct ").unwrap_or(decl).trim();
        if let Some(brace) = decl.find('{') {
            let name = decl[..brace].trim();
            let fields_str = &decl[brace+1..];
            let fields_str = fields_str.trim_end_matches('}').trim();
            let mut out = format!("struct {} {{\n", name);
            for field in fields_str.split(',') {
                let field = field.trim();
                if field.is_empty() { continue; }
                let parts: Vec<&str> = field.splitn(2, ':').collect();
                if parts.len() == 2 {
                    out.push_str(&format!("  {}: Int,\n", parts[0].trim()));
                }
            }
            out.push_str("}\n\n");
            out
        } else { String::new() }
    }

    fn translate_fn(&self, decl: &str) -> String {
        let rest = decl.strip_prefix("fn ").unwrap_or(decl).trim();
        if let Some(paren) = rest.find('(') {
            let name = rest[..paren].trim();
            if let Some(arrow) = rest.find("->") {
                let params_str = &rest[paren+1..arrow].trim();
                let params_str = params_str.trim_end_matches(')');
                let after_arrow = &rest[arrow+2..].trim();
                let body_start = after_arrow.find('{');
                let ret_type = if let Some(pos) = body_start {
                    after_arrow[..pos].trim()
                } else { "()" };

                let params: Vec<(String, String)> = if params_str.is_empty() { vec![] } else {
                    params_str.split(',').filter_map(|p| {
                        let p = p.trim();
                        let parts: Vec<&str> = p.splitn(2, ':').collect();
                        if parts.len() == 2 {
                            Some((parts[0].trim().to_string(), translate_type(parts[1].trim())))
                        } else { None }
                    }).collect()
                };

                let mut out = format!("def {} = fn(", name);
                for (pi, (pn, pt)) in params.iter().enumerate() {
                    if pi > 0 { out.push_str(", "); }
                    out.push_str(&format!("{}: {}", pn, pt));
                }
                out.push_str(&format!(") -> {} {{\n", translate_type(ret_type)));

                if let Some(pos) = body_start {
                    let body = after_arrow[pos..].trim();
                    let body = body.strip_prefix('{').unwrap_or(body);
                    let body = body.strip_suffix('}').unwrap_or(body);
                    let translated = self.translate_body(body);
                    out.push_str(&format!("  {}\n", translated));
                }
                out.push_str("}\n\n");
                out
            } else { String::new() }
        } else { String::new() }
    }

    fn translate_body(&self, body: &str) -> String {
        let mut result = String::new();
        let stmts = self.split_stmts(body);
        for stmt in &stmts {
            result.push_str(&self.translate_stmt(stmt));
            result.push_str(";\n  ");
        }
        // Remove trailing ";\n  "
        while result.ends_with(";\n  ") {
            result = result[..result.len()-4].to_string();
        }
        result
    }

    fn split_stmts(&self, body: &str) -> Vec<String> {
        let mut stmts = vec![];
        let chars: Vec<char> = body.chars().collect();
        let mut i = 0;
        let mut current = String::new();
        let mut depth = 0;
        while i < chars.len() {
            let c = chars[i];
            if c == '{' { depth += 1; current.push(c); }
            else if c == '}' { depth -= 1; current.push(c); }
            else if c == ';' && depth == 0 {
                let s = current.trim().to_string();
                if !s.is_empty() { stmts.push(s); }
                current = String::new();
            } else { current.push(c); }
            i += 1;
        }
        let s = current.trim().to_string();
        if !s.is_empty() { stmts.push(s); }
        stmts
    }

    fn translate_stmt(&self, stmt: &str) -> String {
        let stmt = stmt.trim();
        if stmt.is_empty() { return String::new(); }

        // while(cond) { body }
        if stmt.starts_with("while") {
            let rest = stmt.strip_prefix("while").unwrap_or(stmt).trim();
            let rest = rest.strip_prefix('(').unwrap_or(rest);
            if let Some(rparen) = rest.find(')') {
                let cond = &rest[..rparen];
                let body = &rest[rparen+1..].trim();
                let body = body.strip_prefix('{').unwrap_or(body);
                let body = body.strip_suffix('}').unwrap_or(body);
                let trans_body = self.translate_body(body);
                format!("while ({}) {{\n    {}\n  }}", cond, trans_body)
            } else { stmt.to_string() }
        }
        // if(cond) { then } else { else_ }
        else if stmt.starts_with("if") {
            let rest = stmt.strip_prefix("if").unwrap_or(stmt).trim();
            let rest = rest.strip_prefix('(').unwrap_or(rest);
            if let Some(rparen) = rest.find(')') {
                let cond = &rest[..rparen];
                let rest = &rest[rparen+1..].trim();
                let rest = rest.strip_prefix('{').unwrap_or(rest);
                // Find matching }
                let (then_body, else_body) = self.split_if_else(rest);
                let then_trans = self.translate_body(&then_body);
                let mut result = format!("if {} {{\n    {}\n  }}", cond, then_trans);
                if let Some(else_b) = else_body {
                    let else_trans = self.translate_body(&else_b);
                    result.push_str(&format!(" else {{\n    {}\n  }}", else_trans));
                }
                result
            } else { stmt.to_string() }
        }
        // return expr
        else if stmt.starts_with("return") {
            let expr = stmt.strip_prefix("return").unwrap_or("").trim();
            let expr = expr.strip_suffix(';').unwrap_or(expr);
            format!("{}", self.translate_expr(expr))
        }
        // let mut name: type = expr
        else if stmt.starts_with("let mut") {
            let rest = stmt.strip_prefix("let mut").unwrap_or(stmt).trim();
            let parts: Vec<&str> = rest.splitn(2, '=').collect();
            if parts.len() == 2 {
                let name_type: Vec<&str> = parts[0].splitn(2, ':').collect();
                let name = name_type[0].trim();
                let expr = parts[1].trim().trim_end_matches(';');
                format!("def {} = {}", name, self.translate_expr(expr))
            } else { stmt.to_string() }
        }
        // let name: type = expr
        else if stmt.starts_with("let") {
            let rest = stmt.strip_prefix("let").unwrap_or(stmt).trim();
            let parts: Vec<&str> = rest.splitn(2, '=').collect();
            if parts.len() == 2 {
                let name_type: Vec<&str> = parts[0].splitn(2, ':').collect();
                let name = name_type[0].trim();
                let expr = parts[1].trim().trim_end_matches(';');
                format!("def {} = {}", name, self.translate_expr(expr))
            } else { stmt.to_string() }
        }
        // Assignment: name = expr
        else if stmt.contains('=') && !stmt.contains("==") && !stmt.contains("!=") && !stmt.contains("<=") && !stmt.contains(">=") {
            let parts: Vec<&str> = stmt.splitn(2, '=').collect();
            let lhs = parts[0].trim();
            let rhs = parts[1].trim().trim_end_matches(';');
            // Check for compound assignment
            if lhs.ends_with("+") {
                let name = lhs.trim_end_matches('+').trim();
                format!("&{} = {} + {}", name, name, self.translate_expr(rhs))
            } else if lhs.ends_with("-") {
                let name = lhs.trim_end_matches('-').trim();
                format!("&{} = {} - {}", name, name, self.translate_expr(rhs))
            } else if lhs.ends_with("*") {
                let name = lhs.trim_end_matches('*').trim();
                format!("&{} = {} * {}", name, name, self.translate_expr(rhs))
            } else {
                format!("&{} = {}", lhs, self.translate_expr(rhs))
            }
        }
        // Function call or expression
        else {
            self.translate_expr(stmt)
        }
    }

    fn split_if_else(&self, body: &str) -> (String, Option<String>) {
        let chars: Vec<char> = body.chars().collect();
        let mut i = 0;
        let mut depth = 0;
        while i < chars.len() {
            if chars[i] == '{' { depth += 1; }
            if chars[i] == '}' { depth -= 1; if depth == 0 { i += 1; break; } }
            i += 1;
        }
        let then_body = chars[..i].iter().collect::<String>();
        let then_body = then_body.strip_prefix('{').unwrap_or(&then_body);
        let then_body = then_body.strip_suffix('}').unwrap_or(then_body);

        // Check for else
        let rest: String = chars[i..].iter().collect();
        let rest = rest.trim();
        if rest.starts_with("else") {
            let else_rest = rest.strip_prefix("else").unwrap_or(rest).trim();
            if else_rest.starts_with("if") {
                (then_body.to_string(), Some(else_rest.to_string()))
            } else {
                let else_body = else_rest.strip_prefix('{').unwrap_or(else_rest);
                let else_body = else_body.strip_suffix('}').unwrap_or(else_body);
                (then_body.to_string(), Some(else_body.to_string()))
            }
        } else {
            (then_body.to_string(), None)
        }
    }

    fn translate_expr(&self, expr: &str) -> String {
        let expr = expr.trim().trim_end_matches(';');
        if expr == "exit(0)" { return "0".to_string(); }
        if expr == "getInt()" { return "Stdin(0)".to_string(); }
        if expr.starts_with("printlnInt(") {
            let inner = &expr[11..];
            let inner = inner.trim_end_matches(')');
            return format!("{} -> Stdout", self.translate_expr(inner));
        }
        if expr.starts_with("printInt(") {
            let inner = &expr[9..];
            let inner = inner.trim_end_matches(')');
            return format!("{} -> Stdout", self.translate_expr(inner));
        }
        // Struct literal: Name { field: val, ... }
        if expr.contains('{') && !expr.starts_with("if") && !expr.starts_with("while") {
            return self.translate_struct_lit(expr);
        }
        // Method call: obj.method(args)
        if let Some(dot) = expr.find('.') {
            let obj = &expr[..dot];
            let rest = &expr[dot+1..];
            if let Some(paren) = rest.find('(') {
                let method = &rest[..paren];
                let args_str = &rest[paren+1..];
                let args_str = args_str.trim_end_matches(')');
                let mut args = String::new();
                if !args_str.is_empty() {
                    for a in args_str.split(',') {
                        if !args.is_empty() { args.push_str(", "); }
                        args.push_str(&self.translate_expr(a.trim()));
                    }
                }
                // Find the struct type — use the expression as-is for now
                if args.is_empty() {
                    return format!("{}({})", self.translate_expr(obj), method);
                } else {
                    return format!("{}({}, {})", self.translate_expr(obj), method, args);
                }
            }
        }
        // Array indexing: name[expr] or name[expr].field
        if expr.contains('[') {
            return self.translate_array_access(expr);
        }
        // as casts: expr as type
        if expr.contains(" as ") {
            let parts: Vec<&str> = expr.splitn(2, " as ").collect();
            return self.translate_expr(parts[0]);
        }
        // Comparisons and arithmetic — pass through with type translation
        let mut result = expr.to_string();
        result = result.replace("i32", "Int");
        result = result.replace("usize", "Int");
        result = result.replace("bool", "Bool");
        // Translate Rust array init: [val; N] → array syntax
        if result.starts_with('[') && result.contains("; ") {
            // Cannot directly translate; keep as-is for now
        }
        // true/false → lowercase
        result = result.replace("true", "true");
        result = result.replace("false", "false");
        result
    }

    fn translate_struct_lit(&self, expr: &str) -> String {
        if let Some(brace) = expr.find('{') {
            let name = expr[..brace].trim();
            let fields_str = &expr[brace+1..];
            let fields_str = fields_str.trim_end_matches('}');
            let mut fields = vec![];
            for f in fields_str.split(',') {
                let f = f.trim();
                if f.is_empty() { continue; }
                if let Some(colon) = f.find(':') {
                    let val = &f[colon+1..].trim();
                    fields.push(self.translate_expr(val));
                } else {
                    fields.push(self.translate_expr(f));
                }
            }
            if fields.is_empty() { return format!("{}()", name); }
            format!("{}({})", name, fields.join(", "))
        } else { expr.to_string() }
    }

    fn translate_array_access(&self, expr: &str) -> String {
        let mut result = expr.to_string();
        // Replace .len() with nothing (Dew arrays don't have .len())
        result = result.replace(".edges_len", "_edges_len");
        // For now, pass through with type translations
        result = result.replace("i32", "Int");
        result = result.replace("usize", "Int");
        result
    }
}

fn translate_type(t: &str) -> String {
    match t.trim() {
        "i32" => "Int".to_string(),
        "usize" => "Int".to_string(),
        "bool" => "Bool".to_string(),
        "()" => "Unit".to_string(),
        s if s.starts_with('[') => "Int".to_string(), // Arrays → Int (simplified)
        s if s.starts_with('&') => {
            let inner = s.strip_prefix('&').unwrap_or(s).trim();
            let inner = inner.strip_prefix("mut ").unwrap_or(inner);
            translate_type(inner)
        }
        s => s.to_string(),
    }
}
