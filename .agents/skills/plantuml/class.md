# Class Diagram Conventions

- **Granularity**: Monolithic. Never split by modules. Embrace single-view diagrams for the entire domain to preserve overarching context.
- **Relationships**: Be explicit about composition (`*--`) versus aggregation (`o--`). Do not use labels on associations.
- **Multiplicities**: Never include "1". Example: `1:N` becomes `ClassA -- "0..*" ClassB`. If `1:1`, omit both sides.
- **Visuals**: Use `together { ... }` blocks to semantically group related classes and reduce line crossing.
