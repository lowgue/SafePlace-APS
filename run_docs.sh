#!/bin/bash

echo "🚀 Ativando o ambiente e iniciando o servidor da documentação (MkDocs)..."
source .venv/bin/activate
mkdocs serve
