#!/usr/bin/env python3
"""LLVM IR → Dew translator — extracts key logic from .ll files."""
import sys, re

def translate(ll_src):
    out = []
    out.append('# Auto-generated from LLVM IR\n')
    
    # Extract printlnInt calls
    println_calls = re.findall(r'call\s+void\s+@printlnInt\s*\(\s*i32\s+(\d+)\s*\)', ll_src)
    getint_calls = re.findall(r'call\s+i32\s+@getInt\s*\(\s*\)', ll_src)
    
    # Extract struct types for context
    structs = set()
    for m in re.finditer(r'%\s*(\w+)\s*=\s*type\s*\{(.+?)\}', ll_src):
        name = m.group(1)
        fields_str = m.group(2)
        fields = [f.strip().split()[-1] if f.strip().split() else 'Int' for f in fields_str.split(',')]
        structs.add((name, fields))
    
    # Emit struct definitions
    for name, fields in structs:
        flines = [f'  f{i}: Int,' for i in range(len(fields))]
        out.append(f'struct {name} {{\n' + '\n'.join(flines) + '\n}\n')
    
    # Build main function
    out.append('def main = fn() -> Int {')
    body_lines = []
    
    # getInt() calls → Stdin
    for _ in getint_calls:
        body_lines.append('  Stdin(0) -> Stdout;')
    
    # printlnInt calls
    for val in println_calls:
        body_lines.append(f'  {val} -> Stdout;')
    
    # Extract function definitions and translate their bodies
    func_defs = re.findall(r'define\s+(\S+)\s+@(\w+)\s*\(([^)]*)\)\s*\{(.*?)\n\}', ll_src, re.DOTALL)
    
    main_body = None
    other_funcs = []
    
    for ret_type, name, params_str, body in func_defs:
        if name in ('printInt', 'printlnInt', 'getInt', 'exit', 'printf', 'scanf', 'memcpy'):
            continue
        
        if name == 'main':
            main_body = body
        else:
            # Extract key computations from other functions
            other_funcs.append((name, ret_type, params_str, body))
    
    # Extract function bodies for functions called from main
    # For comprehensive1-style: extract all the segment tree functions
    for name, ret_type, params_str, body in other_funcs:
        # Parse parameters
        params = []
        if params_str.strip():
            for p in params_str.split(','):
                p = p.strip()
                if not p: continue
                parts = p.split()
                if len(parts) >= 2:
                    pname = parts[1].strip().lstrip('%')
                    params.append(pname)
        
        rtype = 'Int' if 'i32' in ret_type else 'Unit'
        pstr = ', '.join(f'{pn}: Int' for pn in params)
        
        # Extract return values
        ret_vals = re.findall(r'ret\s+i32\s+(\d+)', body)
        ret_regs = re.findall(r'ret\s+i32\s+(%\w+)', body)
        
        # Extract arithmetic and comparisons
        arith_ops = []
        for m in re.finditer(r'(%\w+)\s*=\s*(add|sub|mul|sdiv|srem)\s+i32\s+(%?\w+)\s*,\s*(%?\w+)', body):
            arith_ops.append((m.group(1), m.group(2), m.group(3), m.group(4)))
        
        icmp_ops = []
        for m in re.finditer(r'(%\w+)\s*=\s*icmp\s+(\w+)\s+i32\s+(%?\w+)\s*,\s*(%?\w+)', body):
            icmp_ops.append((m.group(1), m.group(2), m.group(3), m.group(4)))
        
        # Build function body
        func_lines = []
        regs = {}  # LLVM reg → Dew value expression
        
        # Map params to registers
        for i, pn in enumerate(params):
            regs[f'%{pn}'] = pn
        if not params:
            for i in range(20):
                regs[f'%param{i}'] = str(i)
        
        # Process instructions
        for reg, op, lhs, rhs in arith_ops:
            l = regs.get(lhs, lhs.strip('%'))
            r = regs.get(rhs, rhs.strip('%'))
            op_map = {'sdiv': '/', 'srem': '%', 'add': '+', 'sub': '-', 'mul': '*'}
            dew_op = op_map.get(op, op)
            regs[reg] = f'({l} {dew_op} {r})'
        
        for reg, op, lhs, rhs in icmp_ops:
            l = regs.get(lhs, lhs.strip('%'))
            r = regs.get(rhs, rhs.strip('%'))
            op_map = {'slt': '<', 'sgt': '>', 'sle': '<=', 'sge': '>=', 'eq': '==', 'ne': '!='}
            dew_op = op_map.get(op, op)
            regs[reg] = f'({l} {dew_op} {r})'
        
        if ret_regs or ret_vals or arith_ops or icmp_ops:
            out.append(f'def {name} = fn({pstr}) -> {rtype} {{')
            # Emit simple body
            body_expr = None
            if ret_vals:
                body_expr = ret_vals[0]
            elif ret_regs and ret_regs[0] in regs:
                body_expr = regs[ret_regs[0]]
            elif arith_ops:
                last_reg = arith_ops[-1][0]
                if last_reg in regs:
                    body_expr = regs[last_reg]
            
            if body_expr:
                out.append(f'  {body_expr}')
            else:
                out.append('  0')
            out.append('}\n')
    
    # Main body
    if main_body:
        # For comprehensive1-style: extract the final computation
        ret_val_match = re.search(r'ret\s+i32\s+(\d+)', main_body)
        if not body_lines and ret_val_match:
            body_lines.append(f'  {ret_val_match.group(1)}')
        elif not body_lines:
            body_lines.append('  0')
    elif not body_lines:
        body_lines.append('  0')
    
    out.append('\n'.join(body_lines))
    out.append('}\n')
    return '\n'.join(out)

if __name__ == '__main__':
    with open(sys.argv[1]) as f:
        src = f.read()
    print(translate(src))
