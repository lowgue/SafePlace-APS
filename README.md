# SafePlace-APS

Bem-vindo ao repositório do projeto **SafePlace-APS**.

## 📚 Como rodar a documentação (MkDocs)

A documentação deste projeto é gerenciada através do [MkDocs](https://www.mkdocs.org/). 

Para subir o servidor local e visualizar a documentação no seu navegador, execute o script de inicialização na raiz do projeto:

```bash
./run_docs.sh
```

Este script ativará automaticamente o ambiente virtual (`.venv`) e executará o comando `mkdocs serve`. A documentação ficará acessível, por padrão, em `http://127.0.0.1:8000`.

## 📊 Como fazer diagramas (PlantUML)

A documentação visual (Diagrama de Classes, Casos de Uso, Sequência, etc.) do projeto é construída utilizando **PlantUML**.

Para criar ou atualizar diagramas, siga as seguintes diretrizes:

1. **Local dos Arquivos**: Salve todos os códigos-fonte de diagramas (`.puml`) no diretório `docs/diagrams/`.
2. **Padrão Visual**: Todos os diagramas devem possuir um visual limpo e padronizado. O bloco de configuração abaixo deve ser incluído no início de todo arquivo:
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
3. **Linguagem Ubíqua e Multiplicidades**: Use apenas os termos de domínio em português definidos no `CONTEXT.md`. Além disso, para relações de cardinalidade 1, o número "1" deve ser omitido (ex: em vez de `1..*`, use apenas `0..*` ou o lado N).
4. **Usando a Skill de IA**: Caso esteja usando o assistente virtual, você pode solicitar a criação de um diagrama referenciando a skill `@plantuml`, que automaticamente aplicará todas as convenções visuais, léxicas e estruturais estipuladas para este projeto.