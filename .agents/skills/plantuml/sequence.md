# Sequence Diagram Conventions

- **Complexity**: Map lifelines directly to domain classes and actors, not generic "Controllers" or "Systems".
- **Methods**: Messages between lifelines must correspond to actual class methods defined in the domain model (e.g., `Estoque -> EPI : verificarValidadeCA()`).
- **Structure**: Group by Use Case. Store files inside `docs/diagrams/Sequence/`.
- **Logic**: Use `alt`, `opt`, and `loop` fragments to represent business rules, alternate flows, and conditions accurately.
- **Databases**: Use the `database` participant for persistence layers to clarify where state is saved or fetched.
