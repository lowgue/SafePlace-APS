---
name: plantuml
description: diagram. Trigger when the user asks to build, update, or visualize a Class, Sequence, Use Case, or Component model using PlantUML.
---

# PlantUML

## Steps

1. **Contextualize** — Gather entities from `CONTEXT.md` and `docs/DiagramaClasses.md`.
   *Completion criterion*: Every entity, actor, and relationship maps to the **ubiquitous language**.
2. **Branch** — Follow the rules for your specific diagram type:
   - Class: read [class.md](class.md)
   - Sequence: read [sequence.md](sequence.md)
   - Use Case: read [usecase.md](usecase.md)
   - Component: read [component.md](component.md)
   *Completion criterion*: The specific diagram rules are applied.
3. **Draft** — Write the `.puml` code. Apply shared syntax from [PLANTUML-CONVENTIONS.md](PLANTUML-CONVENTIONS.md).
   *Completion criterion*: The code represents the requested model without syntax errors.
4. **Publish** — Save the `.puml` file in `docs/diagrams/` or its subfolders. Keep the `.puml` source files.
   *Completion criterion*: The `.puml` file is saved and ready for the user.

## Shared Reference

**Visual Standard**:
Always prepend this block to ensure consistent styling across all diagrams:
```plantuml
skinparam monochrome true
skinparam shadowing false
skinparam defaultFontName Arial
skinparam defaultFontSize 14
skinparam roundcorner 10
skinparam maxmessagesize 120
```

**Ubiquitous Language**:
Portuguese only. Use exactly the terms defined in the domain (e.g., `Ocorrencia`, `EPI`, `GestorDeSeguranca`). Never translate to English.
