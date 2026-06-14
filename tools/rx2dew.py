#!/usr/bin/env python3
"""Rx → Dew translator. Processes Rx source (Rust subset) and emits Dew source."""
import sys, re

class Rx2Dew:
    def __init__(self, src):
        self.lines = self._preprocess(src)
        self.structs = {}     # name → [field_names]
        self.impls = {}       # struct_name → [(method_name, params_str, ret_type, body_lines)]
        self.consts = {}      # name → value
        self.out = []

    def _preprocess(self, src):
        lines = []
        in_block = False
        for line in src.split('\n'):
            s = line.strip()
            if in_block:
                if '*/' in s: in_block = False
                continue
            if s.startswith('/*'):
                if '*/' not in s: in_block = True
                continue
            if s.startswith('//') or not s: continue
            lines.append(s)
        return lines

    def translate(self):
        i = 0
        while i < len(self.lines):
            line = self.lines[i]
            # Collect multi-line declarations
            collected = [line]
            # If line opens a brace or contains incomplete syntax, collect until balanced
            depth = line.count('{') - line.count('}')
            while depth > 0 and i + 1 < len(self.lines):
                i += 1
                nl = self.lines[i]
                collected.append(nl)
                depth += nl.count('{') - nl.count('}')
            full = ' '.join(collected)

            if full.startswith('const '):
                self._const(full)
            elif full.startswith('struct '):
                self._struct(full)
            elif full.startswith('impl '):
                self._impl(full)
            elif full.startswith('fn '):
                self._fn(full)
            i += 1

        # Emit collected output
        self._emit_structs()
        self._emit_impls()
        return '\n'.join(self.out)

    def _const(self, s):
        m = re.match(r'const\s+(\w+)\s*:\s*\w+\s*=\s*(.+);?', s)
        if m:
            name, val = m.group(1), m.group(2).strip()
            self.consts[name] = val
            self.out.append(f'def {name} = {val};')

    def _struct(self, s):
        m = re.match(r'struct\s+(\w+)\s*\{([^}]*)\}', s)
        if m:
            name = m.group(1)
            fields_str = m.group(2)
            fields = []
            for f in fields_str.split(','):
                f = f.strip()
                if not f: continue
                fname = f.split(':')[0].strip()
                fields.append(fname)
            self.structs[name] = fields

    def _emit_structs(self):
        for name, fields in self.structs.items():
            flines = [f'  {f}: Int,' for f in fields]
            self.out.append(f'struct {name} {{\n' + '\n'.join(flines) + '\n}\n')

    def _impl(self, s):
        m = re.match(r'impl\s+(\w+)\s*\{(.+)\}', s)
        if m:
            sname = m.group(1)
            body = m.group(2).strip()
            # Find fn definitions within
            for fn_m in re.finditer(r'fn\s+(\w+)\s*\(([^)]*)\)(?:\s*->\s*(\S+(?:\s*\{)?))?\s*\{', body):
                mname = fn_m.group(1)
                params_str = fn_m.group(2).strip()
                ret_type = (fn_m.group(3) or '()').strip().rstrip('{').strip()
                start = fn_m.end()
                depth = 1; j = start
                while j < len(body) and depth > 0:
                    if body[j] == '{': depth += 1
                    elif body[j] == '}': depth -= 1
                    j += 1
                mbody = body[start:j-1].strip()
                # Filter out self params
                params = []
                for p in params_str.split(','):
                    p = p.strip()
                    if not p or p in ('self', '&self', '&mut self'): continue
                    parts = p.split(':')
                    if len(parts) >= 2:
                        params.append(f'{parts[0].strip()}: {self._ty(":".join(parts[1:]).strip())}')

                if sname not in self.impls: self.impls[sname] = []
                self.impls[sname].append((mname, params, self._ty(ret_type), mbody))

    def _emit_impls(self):
        for sname, methods in self.impls.items():
            for mname, params, ret_type, body in methods:
                all_p = [f'self: {sname}'] + params
                pstr = ', '.join(all_p)
                self.out.append(f'def {sname}_{mname} = fn({pstr}) -> {ret_type} {{')
                self.out.append(f'  {self._body(body)}')
                self.out.append('}\n')

    def _fn(self, s):
        m = re.match(r'fn\s+(\w+)\s*\(([^)]*)\)(?:\s*->\s*(\S+))?\s*\{(.+)\}', s)
        if m:
            name = m.group(1)
            params_str = m.group(2).strip()
            ret_type = m.group(3) or 'Unit'
            body = m.group(4).strip()
            params = []
            for p in params_str.split(','):
                p = p.strip()
                if not p: continue
                parts = p.split(':')
                if len(parts) >= 2:
                    pname = parts[0].strip()
                    ptype = self._ty(':'.join(parts[1:]).strip())
                    params.append(f'{pname}: {ptype}')
            pstr = ', '.join(params)
            rty = self._ty(ret_type)
            self.out.append(f'def {name} = fn({pstr}) -> {rty} {{')
            self.out.append(f'  {self._body(body)}')
            self.out.append('}\n')

    def _body(self, body):
        result = []
        # Split into statements
        stmts = self._split_stmts(body)
        for stmt in stmts:
            s = stmt.strip()
            if not s: continue
            translated = self._stmt(s)
            if translated:
                result.append(translated)
        return '\n  '.join(result)

    def _split_stmts(self, body):
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

    def _stmt(self, s):
        s = s.strip()
        if not s: return ''

        # return expr
        if s.startswith('return '):
            return self._expr(s[7:].strip())

        # let mut name: type = expr
        m = re.match(r'let\s+mut\s+(\w+)\s*:\s*(.+?)\s*=\s*(.+)', s)
        if m:
            name, ty, expr = m.group(1), m.group(2), m.group(3)
            # Handle array init: [val; N]
            expr = self._expr(expr)
            return f'def {name} = {expr}'

        # let name: type = expr
        m = re.match(r'let\s+(\w+)\s*:\s*(.+?)\s*=\s*(.+)', s)
        if m:
            name, ty, expr = m.group(1), m.group(2), m.group(3)
            return f'def {name} = {self._expr(expr)}'

        # while(cond) { body }
        m = re.match(r'while\s*\((.+)\)\s*\{(.+)\}', s)
        if m:
            cond = self._expr(m.group(1).strip())
            inner = self._body(m.group(2).strip())
            return f'while ({cond}) {{\n    {inner}\n  }}'

        # if(cond) { then } else { else }
        m = re.match(r'if\s*\((.+)\)\s*\{(.+)\}\s*else\s*\{(.+)\}', s)
        if m:
            cond = self._expr(m.group(1).strip())
            then_b = self._body(m.group(2).strip())
            else_b = self._body(m.group(3).strip())
            return f'if {cond} {{\n    {then_b}\n  }} else {{\n    {else_b}\n  }}'

        m = re.match(r'if\s*\((.+)\)\s*\{(.+)\}\s*else\s+if', s)
        if m:
            cond = self._expr(m.group(1).strip())
            then_b = self._body(m.group(2).strip())
            rest = s[m.end()-2:].strip()
            return f'if {cond} {{\n    {then_b}\n  }} else {self._stmt(rest)}'

        m = re.match(r'if\s*\((.+)\)\s*\{(.+)\}', s)
        if m:
            cond = self._expr(m.group(1).strip())
            then_b = self._body(m.group(2).strip())
            return f'if {cond} {{\n    {then_b}\n  }}'

        # continue
        if s == 'continue': return '// continue'

        # exit(0)
        if s == 'exit(0)': return '0'

        # Assignment: lhs = rhs (or lhs += rhs, etc.)
        m = re.match(r'(\S+(?:\s*\[[^\]]+\])*(?:\.[a-zA-Z_]\w*)*)\s*(\+)?\s*=\s*(.+)', s)
        if m:
            lhs = m.group(1).strip()
            is_plus = m.group(2)
            rhs = self._expr(m.group(3).strip())
            if is_plus:
                return f'&{lhs} = {lhs} + {rhs}'
            return f'&{lhs} = {rhs}'

        # Expression statement
        return self._expr(s)

    def _expr(self, e):
        e = e.strip()
        if not e: return 'Unit'
        if e == 'exit(0)': return '0'
        if e == 'continue': return 'Unit'

        # getInt()
        e = e.replace('getInt()', 'Stdin(0)')

        # printlnInt(x) → x -> Stdout
        e = re.sub(r'printlnInt\((.+)\)', r'\1 -> Stdout', e)
        e = re.sub(r'printInt\((.+)\)', r'\1 -> Stdout', e)

        # Struct literal: Name { f1: v1, f2: v2 }
        m = re.match(r'(\w+)\s*\{([^}]*)\}', e)
        if m:
            name = m.group(1)
            fields_str = m.group(2)
            vals = []
            for f in fields_str.split(','):
                f = f.strip()
                if not f: continue
                if ':' in f:
                    vals.append(self._expr(f.split(':', 1)[1].strip()))
                else:
                    vals.append(self._expr(f))
            return f'{name}({", ".join(vals)})'

        # Method call: obj.method(args)
        m = re.match(r'(.+)\.(\w+)\s*\(([^)]*)\)', e)
        if m:
            obj = self._expr(m.group(1))
            method = m.group(2)
            args_str = m.group(3).strip()
            args = [obj]
            if args_str:
                for a in args_str.split(','):
                    args.append(self._expr(a.strip()))
            return f'{method}({", ".join(args)})'

        # Array literal: [val; N] or [val; N + M]
        m = re.match(r'\[(.+);\s*(.+)\]', e)
        if m:
            val = self._expr(m.group(1).strip())
            n = m.group(2).strip()
            # Use Dew array literal: [val, val, ...] — but for large N, emit val
            if n.isdigit():
                count = int(n)
                return f'[{", ".join([val] * count)}]'
            # Evaluate const expression
            for cname, cval in self.consts.items():
                n = n.replace(cname, cval)
            try:
                count = int(eval(n))
                return f'[{", ".join([val] * count)}]'
            except:
                return val  # Fallback: just use the value

        # Array access: name[idx]
        e = re.sub(r'(\w+)\[([^\]]+)\]', r'\1[\2]', e)

        # as casts: drop
        e = re.sub(r'\s+as\s+\w+', '', e)

        # dereference: *ptr → ptr
        e = re.sub(r'\*(\w+)', r'\1', e)

        # &mut x → x, &[T; N] parameter → drop &
        e = re.sub(r'&(?:mut\s+)?', '', e)

        # Type replacements
        e = e.replace('i32', 'Int')
        e = e.replace('usize', 'Int')
        e = e.replace('bool', 'Bool')

        return e

    def _ty(self, t):
        t = t.strip()
        t = re.sub(r'&(?:mut\s+)?', '', t)
        t = re.sub(r'\[(.+);\s*(.+)\]', r'Int', t)  # arrays → Int
        t = t.replace('i32', 'Int').replace('usize', 'Int').replace('bool', 'Bool')
        t = t.replace('()', 'Unit')
        for name, val in self.consts.items():
            t = t.replace(name, val)
        return t or 'Unit'

if __name__ == '__main__':
    with open(sys.argv[1]) as f:
        src = f.read()
    t = Rx2Dew(src)
    print(t.translate())
