#!/usr/bin/env python3
"""Rx → Dew source-to-source translator. Handles Rust subset used in Rx test suite."""
import sys, re

class Translator:
    def __init__(self, src):
        self.src = src
        self.impls = {}     # struct_name -> [(method_name, params, ret_type, body)]
        self.structs = {}    # struct_name -> [field_names]
        self.consts = {}     # name -> value
        self.out = []

    def translate(self):
        # Preprocess: strip comments, join lines
        code = self.preprocess()
        # Extract impl blocks first (they get processed separately)
        code = self.extract_impls(code)
        # Process top-level declarations
        self.process_toplevel(code)
        # Emit impl methods as standalone functions
        self.emit_impls()
        return '\n'.join(self.out)

    def preprocess(self):
        lines = []
        in_block = False
        for line in self.src.split('\n'):
            line = line.strip()
            if in_block:
                if '*/' in line: in_block = False
                continue
            if line.startswith('/*'):
                if '*/' not in line: in_block = True
                continue
            if line.startswith('//') or not line:
                continue
            lines.append(line)
        return '\n'.join(lines)

    def extract_impls(self, code):
        result = []
        i = 0
        while i < len(code):
            if code[i:i+5] == 'impl ':
                j = i + 5
                name = ''
                while j < len(code) and (code[j].isalnum() or code[j] == '_'):
                    name += code[j]; j += 1
                # Skip to {
                while j < len(code) and code[j] != '{': j += 1
                j += 1  # skip {
                depth = 1
                start = j
                while j < len(code) and depth > 0:
                    if code[j] == '{': depth += 1
                    elif code[j] == '}': depth -= 1
                    j += 1
                body = code[start:j-1]
                self.parse_impl(name, body)
                i = j
            else:
                result.append(code[i]); i += 1
        return ''.join(result)

    def parse_impl(self, struct_name, body):
        methods = []
        # Find fn definitions within impl body
        pattern = r'fn\s+(\w+)\s*\(([^)]*)\)(?:\s*->\s*([^{;]+))?\s*\{'
        for m in re.finditer(pattern, body):
            mname = m.group(1)
            params_str = m.group(2) or ''
            ret_type = (m.group(3) or '()').strip()
            # Find matching }
            start = m.end()
            depth = 1
            j = start
            while j < len(body) and depth > 0:
                if body[j] == '{': depth += 1
                elif body[j] == '}': depth -= 1
                j += 1
            mbody = body[start:j-1].strip()
            params = []
            for p in params_str.split(','):
                p = p.strip()
                if not p: continue
                if p in ('self', '&self', '&mut self'): continue
                parts = p.split(':')
                if len(parts) >= 2:
                    params.append((parts[0].strip(), ':'.join(parts[1:]).strip()))
            methods.append((mname, params, ret_type, mbody))
        if struct_name not in self.impls:
            self.impls[struct_name] = []
        self.impls[struct_name].extend(methods)

    def process_toplevel(self, code):
        # Split on top-level semicolons and closing braces of fn/struct
        stmts = re.split(r';(?![^{]*\})', code)
        for stmt in stmts:
            stmt = stmt.strip()
            if not stmt: continue
            if stmt.startswith('const '):
                self.translate_const(stmt)
            elif stmt.startswith('struct '):
                self.translate_struct(stmt)
            elif stmt.startswith('fn '):
                self.translate_fn(stmt)

    def translate_const(self, stmt):
        m = re.match(r'const\s+(\w+)\s*:\s*\w+\s*=\s*(.+);?', stmt)
        if m:
            self.consts[m.group(1)] = m.group(2).strip()

    def translate_struct(self, stmt):
        m = re.match(r'struct\s+(\w+)\s*\{([^}]*)\}', stmt)
        if m:
            name = m.group(1)
            fields_str = m.group(2)
            fields = []
            for f in fields_str.split(','):
                f = f.strip()
                if not f: continue
                parts = f.split(':')
                if len(parts) >= 2:
                    fields.append(parts[0].strip())
            self.structs[name] = fields
            # Emit Dew struct
            field_lines = [f'  {f}: Int,' for f in fields]
            self.out.append(f'struct {name} {{\n' + '\n'.join(field_lines) + '\n}\n')

    def translate_fn(self, stmt):
        m = re.match(r'fn\s+(\w+)\s*\(([^)]*)\)(?:\s*->\s*([^{]+))?\s*\{', stmt)
        if not m: return
        name = m.group(1)
        params_str = m.group(2) or ''
        ret_type = (m.group(3) or '()').strip()
        # Find the body
        start = m.end()
        depth = 1; j = start
        while j < len(stmt) and depth > 0:
            if stmt[j] == '{': depth += 1
            elif stmt[j] == '}': depth -= 1
            j += 1
        body = stmt[start:j-1].strip()
        params = []
        for p in params_str.split(','):
            p = p.strip()
            if not p: continue
            parts = p.split(':')
            if len(parts) >= 2:
                pname = parts[0].strip()
                ptype = self.map_type(':'.join(parts[1:]).strip())
                params.append((pname, ptype))
        rtype = self.map_type(ret_type)
        pstr = ', '.join(f'{n}: {t}' for n, t in params)
        self.out.append(f'def {name} = fn({pstr}) -> {rtype} {{')
        trans_body = self.translate_body(body)
        self.out.append(f'  {trans_body}')
        self.out.append('}\n')

    def emit_impls(self):
        for sname, methods in self.impls.items():
            for mname, params, ret_type, body in methods:
                all_params = [('self', sname)] + params
                rtype = self.map_type(ret_type)
                pstr = ', '.join(f'{n}: {t}' for n, t in all_params)
                self.out.append(f'def {sname}_{mname} = fn({pstr}) -> {rtype} {{')
                trans_body = self.translate_body(body)
                self.out.append(f'  {trans_body}')
                self.out.append('}\n')

    def translate_body(self, body):
        lines = []
        body = body.strip()
        # Handle while loops first
        body = self.translate_while(body)
        # Split on semicolons at depth 0
        stmts = self.split_stmts(body)
        for stmt in stmts:
            stmt = stmt.strip()
            if not stmt: continue
            lines.append(self.translate_stmt(stmt))
        return '\n  '.join(lines)

    def translate_while(self, body):
        """Replace while(cond) { ... } with placeholder for Dew's fix recursion"""
        result = body
        # For now, translate simple while loops
        pattern = r'while\s*\(([^{]+)\)\s*\{([^}]*(?:\{[^}]*\}[^}]*)*)\}'
        for m in re.finditer(pattern, body):
            cond = m.group(1).strip()
            inner = m.group(2).strip()
            trans_inner = self.translate_body(inner)
            result = result.replace(m.group(0), f'while ({cond}) {{\n    {trans_inner}\n  }}')
        return result

    def split_stmts(self, body):
        stmts = []
        current = ''
        depth = 0; i = 0
        while i < len(body):
            c = body[i]
            if c == '{': depth += 1
            elif c == '}': depth -= 1
            if c == ';' and depth == 0:
                s = current.strip()
                if s: stmts.append(s)
                current = ''
            else:
                current += c
            i += 1
        s = current.strip()
        if s: stmts.append(s)
        return stmts

    def translate_stmt(self, stmt):
        s = stmt.strip().rstrip(';')
        if not s: return ''

        # return expr
        if s.startswith('return '):
            expr = s[7:].strip()
            return self.translate_expr(expr)

        # let mut name: type = expr
        m = re.match(r'let\s+mut\s+(\w+)\s*:\s*([^=]+)=\s*(.+)', s)
        if m:
            name, _, expr = m.group(1), m.group(2), m.group(3)
            return f'def {name} = {self.translate_expr(expr)}'

        # let name: type = expr
        m = re.match(r'let\s+(\w+)\s*:\s*([^=]+)=\s*(.+)', s)
        if m:
            name, _, expr = m.group(1), m.group(2), m.group(3)
            return f'def {name} = {self.translate_expr(expr)}'

        # name = expr (mutation)
        m = re.match(r'(\w+(?:\[[^\]]+\])*(?:\.[a-zA-Z_]\w*)*)\s*=\s*(.+)', s)
        if m and not s.startswith('if') and not s.startswith('while') and not s.startswith('let'):
            lhs = m.group(1)
            rhs = m.group(2)
            return f'&{lhs} = {self.translate_expr(rhs)}'

        # if/else
        if s.startswith('if '):
            return self.translate_if(s)

        # while
        if s.startswith('while '):
            m = re.match(r'while\s*\(([^{]+)\)\s*\{([^}]*)\}', s)
            if m:
                cond = m.group(1).strip()
                inner = m.group(2).strip()
                return f'while ({self.translate_expr(cond)}) {{\n    {self.translate_body(inner)}\n  }}'

        # continue
        if s == 'continue':
            return '// continue (restructured)'

        # exit(0)
        if s == 'exit(0)':
            return '0'

        # Everything else: expression
        return self.translate_expr(s)

    def translate_if(self, s):
        m = re.match(r'if\s*\(([^{]+)\)\s*\{([^}]*(?:\{[^}]*\}[^}]*)*)\}\s*else\s*\{([^}]*)\}', s)
        if m:
            cond = self.translate_expr(m.group(1).strip())
            then_b = self.translate_body(m.group(2).strip())
            else_b = self.translate_body(m.group(3).strip())
            return f'if {cond} {{\n    {then_b}\n  }} else {{\n    {else_b}\n  }}'

        m = re.match(r'if\s*\(([^{]+)\)\s*\{([^}]*)\}\s*else\s+', s)
        if m:
            cond = self.translate_expr(m.group(1).strip())
            then_b = self.translate_body(m.group(2).strip())
            rest = s[m.end():].strip()
            return f'if {cond} {{\n    {then_b}\n  }} else {{\n    {self.translate_stmt(rest)}\n  }}'

        m = re.match(r'if\s*\(([^{]+)\)\s*\{([^}]*)\}', s)
        if m:
            cond = self.translate_expr(m.group(1).strip())
            then_b = self.translate_body(m.group(2).strip())
            return f'if {cond} {{\n    {then_b}\n  }}'

        return s

    def translate_expr(self, expr):
        e = expr.strip()
        if not e: return 'Unit'

        # exit(0)
        if e == 'exit(0)': return '0'

        # getInt()
        if 'getInt()' in e:
            return e.replace('getInt()', 'Stdin(0)')

        # printlnInt(x)
        if e.startswith('printlnInt('):
            inner = e[11:].rstrip(')')
            return f'{self.translate_expr(inner)} -> Stdout'

        # printInt(x)
        if e.startswith('printInt('):
            inner = e[9:].rstrip(')')
            return f'{self.translate_expr(inner)} -> Stdout'

        # Struct literal: Name { field: val, ... }
        m = re.match(r'(\w+)\s*\{([^}]*)\}', e)
        if m:
            name = m.group(1)
            fields_str = m.group(2)
            vals = []
            for f in fields_str.split(','):
                f = f.strip()
                if not f: continue
                if ':' in f:
                    vals.append(self.translate_expr(f.split(':', 1)[1].strip()))
                else:
                    vals.append(self.translate_expr(f))
            return f'{name}({", ".join(vals)})'

        # Method call: obj.method(args)
        m = re.match(r'(\w+(?:\[[^\]]+\])*(?:\.[a-zA-Z_]\w*)*)\.(\w+)\s*\(([^)]*)\)', e)
        if m:
            obj = m.group(1)
            method = m.group(2)
            args_str = m.group(3)
            args = []
            if args_str.strip():
                for a in args_str.split(','):
                    args.append(self.translate_expr(a.strip()))
            # Look up struct type for method
            return f'{method}({", ".join([self.translate_expr(obj)] + args)})'

        # Array literal: [val; N]
        m = re.match(r'\[([^;]+);\s*(\d+)\]', e)
        if m:
            val = self.translate_expr(m.group(1).strip())
            n = m.group(2)
            return f'[{", ".join([val] * int(n))}]'

        # Array access: name[idx]
        m = re.match(r'(\w+)\[([^\]]+)\]', e)
        if m:
            name = m.group(1)
            idx = self.translate_expr(m.group(2).strip())
            return f'{name}[{idx}]'

        # as casts: drop them
        e = re.sub(r'\s+as\s+\w+', '', e)

        # Replace types
        e = e.replace('i32', 'Int')
        e = e.replace('usize', 'Int')
        e = e.replace('bool', 'Bool')

        return e

    def map_type(self, t):
        t = t.strip()
        t = re.sub(r'\s+as\s+\w+', '', t)
        for name, val in self.consts.items():
            t = t.replace(name, val)
        t = t.replace('i32', 'Int')
        t = t.replace('usize', 'Int')
        t = t.replace('bool', 'Bool')
        t = t.replace('()', 'Unit')
        t = re.sub(r'\[([^;]+);\s*(\d+)\]', r'Int', t)  # array types → Int (simplified)
        t = re.sub(r'&(?:mut\s+)?', '', t)  # remove reference markers
        return t or 'Unit'


if __name__ == '__main__':
    if len(sys.argv) < 2:
        print("usage: rx2dew.py <file.rx>", file=sys.stderr)
        sys.exit(1)
    with open(sys.argv[1]) as f:
        src = f.read()
    t = Translator(src)
    print(t.translate())
