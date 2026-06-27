use serde::{Deserialize, Serialize};

#[derive(Debug, Clone, PartialEq, Eq, Serialize, Deserialize)]
pub enum IrType {
    Int,
    Bool,
    Char,
    Unit,
    Struct(String),
    Enum(String),
    Fun(Vec<IrType>, Box<IrType>),
    Tuple(Vec<IrType>),
    Array(Box<IrType>, usize),
    ThunkRef(Box<IrType>),
}

impl IrType {
    pub fn display(&self) -> String {
        match self {
            IrType::Int => "Int".into(),
            IrType::Bool => "Bool".into(),
            IrType::Char => "Char".into(),
            IrType::Unit => "Unit".into(),
            IrType::Struct(n) => n.clone(),
            IrType::Enum(n) => n.clone(),
            IrType::Fun(p, r) => format!("({}) -> {}", p.iter().map(|t| t.display()).collect::<Vec<_>>().join(", "), r.display()),
            IrType::Tuple(ts) => format!("({})", ts.iter().map(|t| t.display()).collect::<Vec<_>>().join(", ")),
            IrType::Array(t, n) => format!("[{}; {}]", t.display(), n),
            IrType::ThunkRef(t) => format!("ThunkRef({})", t.display()),
        }
    }
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct StructDef {
    pub name: String,
    pub fields: Vec<(String, IrType)>,
    pub size: usize,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct EnumDef {
    pub name: String,
    pub variants: Vec<VariantDef>,
    pub size: usize,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct VariantDef {
    pub name: String,
    pub tag: usize,
    pub fields: Vec<(String, IrType)>,
}

#[derive(Debug, Clone, Default, Serialize, Deserialize)]
pub struct TypeTable {
    pub structs: Vec<StructDef>,
    pub enums: Vec<EnumDef>,
}

impl TypeTable {
    pub fn new() -> Self { TypeTable { structs: vec![], enums: vec![] } }

    pub fn add_struct(&mut self, def: StructDef) { self.structs.push(def); }
    pub fn add_enum(&mut self, def: EnumDef) { self.enums.push(def); }

    pub fn struct_field_index(&self, name: &str, field: &str) -> Option<usize> {
        self.structs.iter().find(|s| s.name == name)
            .and_then(|s| s.fields.iter().position(|(n, _)| n == field))
    }

    pub fn enum_variant_tag(&self, name: &str, variant: &str) -> Option<usize> {
        self.enums.iter().find(|e| e.name == name)
            .and_then(|e| e.variants.iter().find(|v| v.name == variant).map(|v| v.tag))
    }

    pub fn find_enum_for_variant(&self, variant: &str) -> Option<&EnumDef> {
        self.enums.iter().find(|e| e.variants.iter().any(|v| v.name == variant))
    }

    /// Returns (enum_name, variant_name) if the name is a zero-payload enum variant.
    pub fn find_zero_payload_variant(&self, name: &str) -> Option<(String, String)> {
        for enum_def in &self.enums {
            for variant in &enum_def.variants {
                if variant.name == name && variant.fields.is_empty() {
                    return Some((enum_def.name.clone(), variant.name.clone()));
                }
            }
        }
        None
    }
}
