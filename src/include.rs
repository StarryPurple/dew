/// C-style #include preprocessor for Dew.
/// Replaces `include "path.dew"` directives with file contents.
/// Supports recursive includes with cycle detection.
use std::collections::HashSet;
use std::fs;
use std::path::{Path, PathBuf};

/// Preprocess source: expand all `include "..."` directives.
/// `base_dir` is the directory of the file being processed (for relative paths).
pub fn preprocess(source: &str, base_dir: &Path) -> Result<String, String> {
    let mut visited = HashSet::new();
    expand_includes(source, base_dir, &mut visited)
}

fn expand_includes(
    source: &str,
    base_dir: &Path,
    visited: &mut HashSet<PathBuf>,
) -> Result<String, String> {
    let mut output = String::with_capacity(source.len());
    let mut i = 0;
    let chars: Vec<char> = source.chars().collect();

    while i < chars.len() {
        // Check for `include "file.dew"` at start of line (after optional whitespace)
        if is_line_start(&chars, i) && match_keyword(&chars, i, "include") {
            i += "include".len();
            skip_whitespace(&chars, &mut i);

            // Expect a quoted string
            if i >= chars.len() || chars[i] != '"' {
                return Err(format!("expected '\"' after include at position {i}"));
            }
            i += 1; // skip opening quote

            let mut path_str = String::new();
            while i < chars.len() && chars[i] != '"' {
                path_str.push(chars[i]);
                i += 1;
            }
            if i >= chars.len() {
                return Err("unterminated string in include directive".into());
            }
            i += 1; // skip closing quote

            // Resolve the included file
            let included_path = if Path::new(&path_str).is_absolute() {
                PathBuf::from(&path_str)
            } else {
                base_dir.join(&path_str)
            };

            let canonical = included_path
                .canonicalize()
                .unwrap_or_else(|_| included_path.clone());

            if visited.contains(&canonical) {
                return Err(format!(
                    "circular include detected: {}",
                    canonical.display()
                ));
            }

            let included_source = fs::read_to_string(&included_path).map_err(|e| {
                format!("cannot read include '{}': {e}", included_path.display())
            })?;

            visited.insert(canonical.clone());

            // Expand includes in the included file (relative to its directory)
            let included_dir = canonical.parent().unwrap_or(base_dir);
            let expanded = expand_includes(&included_source, included_dir, visited)?;

            // Ensure proper newline separation
            if !output.is_empty() && !output.ends_with('\n') {
                output.push('\n');
            }
            output.push_str(&expanded);
            if !expanded.ends_with('\n') {
                output.push('\n');
            }

            visited.remove(&canonical);

            // Skip rest of the include line
            while i < chars.len() && chars[i] != '\n' {
                i += 1;
            }
            if i < chars.len() {
                i += 1; // skip newline
            }
        } else {
            output.push(chars[i]);
            i += 1;
        }
    }

    Ok(output)
}

fn is_line_start(chars: &[char], pos: usize) -> bool {
    if pos == 0 {
        return true;
    }
    // Walk back to find start of line
    let mut p = pos;
    while p > 0 {
        p -= 1;
        if chars[p] == '\n' {
            return true;
        }
        if !chars[p].is_whitespace() {
            return false;
        }
    }
    true
}

fn match_keyword(chars: &[char], pos: usize, keyword: &str) -> bool {
    let kw_chars: Vec<char> = keyword.chars().collect();
    if pos + kw_chars.len() > chars.len() {
        return false;
    }
    for (i, &kc) in kw_chars.iter().enumerate() {
        if chars[pos + i] != kc {
            return false;
        }
    }
    true
}

fn skip_whitespace(chars: &[char], pos: &mut usize) {
    while *pos < chars.len() && chars[*pos].is_whitespace() {
        *pos += 1;
    }
}
