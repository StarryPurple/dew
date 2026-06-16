// IR Generation: Annotated AST → IR Module.
// Lowers expressions to SSA instructions, inserts thunk allocation, creates closures.

pub struct IrGenerator;

impl IrGenerator {
    pub fn new() -> Self {
        IrGenerator
    }
}
