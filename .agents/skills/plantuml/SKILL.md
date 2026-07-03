---
name: plantuml
description: Generate or update PlantUML diagrams. Use when the user wants to visualize the architecture, class models, use cases, or flows using PlantUML, or asks to create a UML diagram.
---

# PlantUML Diagrams

Actively design and maintain the system's visual documentation using PlantUML. This skill ensures that generated diagrams follow the **SafePlace** project's ubiquitous language, standard UML conventions, and maintain a consistent visual style.

## Invocation

This is a **model-invoked** skill. Reach for it whenever a UML diagram (Class, Sequence, Use Case, Component) is requested or when refactoring architecture requires visual updates. 

## File structure

Store generated diagrams in the `docs/diagrams/` folder unless specified otherwise. Keep the `.puml` source files alongside any exported images or embedded within markdown files using the ```plantuml code block.

## Steps

Follow these steps strictly to produce a **compliant** diagram.

1. **Contextualize** — Identify what kind of diagram is needed and gather the entities from `CONTEXT.md` and `docs/DiagramaClasses.md`. Do not invent new domain terms; always reuse the existing ubiquitous language. Completion criterion: Every entity and relationship to be diagrammed maps to an existing domain concept or a newly agreed-upon one.
2. **Draft** — Write the PlantUML code following the rules in [PLANTUML-CONVENTIONS.md](PLANTUML-CONVENTIONS.md). Use standard UML notations for visibility, relationships, and multiplicity. Completion criterion: The `.puml` code correctly represents the requested model without syntax errors.
3. **Review** — Check the drafted diagram against the project conventions. Completion criterion: The diagram uses Portuguese terms, correct casing (PascalCase for classes, camelCase for attributes), and follows the multiplicity/association rules.
4. **Publish** — Save the `.puml` file or update the markdown integration. Completion criterion: The user can view the diagram in the documentation.

## Core Principles

- **Visual Standard**: All diagrams must follow a unified explicit style standard. Always include the following `skinparam` block at the top of your diagrams:
  ```plantuml
  skinparam class {
    BackgroundColor White
    BorderColor Black
    ArrowColor Black
    FontSize 12
  }
  skinparam packageStyle rectangle
  skinparam linetype ortho
  skinparam nodesep 70
  skinparam ranksep 90
  skinparam shadowing false
  ```
- **Precision over decoration**: Focus on correct UML semantics (composition vs aggregation, correct multiplicities). Avoid adding custom colors beyond the defined visual standard. **Crucial Rule for Multiplicities**: Never include the number "1" in any association. If a relationship is 1:N (e.g., 1 to 0..*), omit the "1" entirely (e.g., write `ClassA -- "0..*" ClassB`). If it is 1:1, omit both sides.
- **Ubiquitous Language**: Never translate domain terms to English. Use exactly the terms defined in `CONTEXT.md` (e.g., `Ocorrencia`, `EPI`, `Funcionario`).
- **Granularity**: Never split diagrams by modules. Embrace monolithic, single-view diagrams for the entire domain to preserve the overarching context and relationships, regardless of size.
