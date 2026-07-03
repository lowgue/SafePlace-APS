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

- **Monochrome Theme**: All diagrams must be black and white. Use `skinparam monochrome true`.
- **Precision over decoration**: Focus on correct UML semantics (composition vs aggregation, correct multiplicities). Avoid adding custom colors.
- **Ubiquitous Language**: Never translate domain terms to English. Use exactly the terms defined in `CONTEXT.md` (e.g., `Ocorrencia`, `EPI`, `Funcionario`).
- **Granularity**: Avoid monolithic diagrams. Seam models logically. If a class diagram becomes too large, split it by module (e.g., Módulo de Segurança, Módulo de Inventário).
