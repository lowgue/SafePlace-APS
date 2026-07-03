---
title: "SafePlace — Documentação do Projeto"
subtitle: "Análise e Projeto de Software — 2026/01"
author: "Izabel de Oliveira Boaventura, Luan Rodrigues Martins, Mariana Ferrão Chuquel, Rafaela de Menezes, Tauani Ximenes Sauceda"
date: "Julho de 2026"
lang: pt-BR
toc: true
toc-depth: 3
number-sections: true
---

# SafePlace — Sistema de Segurança do Trabalho

> **Disciplina:** Análise e Projeto de Software — 2026/01
> **Docente:** Gilleanes Thorwald Araujo Guedes
> **Equipe:** Izabel de Oliveira Boaventura, Luan Rodrigues Martins, Mariana Ferrão Chuquel, Rafaela de Menezes, Tauani Ximenes Sauceda

---

## Visão Geral

O **SafePlace** é um sistema web de gestão integrada de Segurança do Trabalho, desenvolvido para digitalizar, centralizar e automatizar os processos de prevenção, monitoramento e resposta a riscos ocupacionais em ambientes industriais e empresariais.

O sistema tem como propósito substituir controles manuais fragmentados (planilhas, documentos físicos e registros em papel) por uma plataforma única, auditável e em conformidade com as normas regulamentadoras brasileiras.

---

## O Desafio e a Solução

| Cenário Problemático | A Solução SafePlace |
| :--- | :--- |
| **Rastreabilidade deficiente de EPIs** | Controle completo de validade, distribuição e condições dos equipamentos. |
| **Monitoramento ausente ou manual** | Integração via IoT com latência máxima de 500 ms para geração de alertas automáticos. |
| **Gestão reativa de acidentes** | Registro imediato com correlação automática de causas, tarefas e áreas de risco. |
| **Conformidade legal fragmentada** | Centralização de treinamentos, ASOs e emissão automatizada de formulários legais (CAT). |
| **Inexistência de simulações** | Módulo de simulação de rotas de fuga com bloqueios dinâmicos e cálculo de tempo de evacuação. |

---

## Funcionalidades Principais

### Gestão de Ocorrências e Incidentes

- **Registro Unificado:** Arquivamento centralizado de acidentes e quase-acidentes com vinculação de mídias e testemunhas.
- **Análise de Causas:** Suporte a metodologias como Árvore de Causas e 5 Porquês.
- **Automação Legal:** Geração automática da Comunicação de Acidente de Trabalho (CAT).

### EPIs e Suprimentos

- **Rastreabilidade Individual:** Controle estrito de entrega, validade e devolução por funcionário.
- **Substituição Inteligente:** Cálculo autônomo de desgaste cruzando uso e ambiente.
- **Gestão de CA:** Verificação da validade do Certificado de Aprovação no momento da entrada em estoque.
- **Reposição:** Geração de requisições de compra automáticas ao atingir o nível crítico.

### Sensores e Emergências

- **Telemetria:** Integração com sensores ambientais (gases, vibração, temperatura) com latência máxima de 500 ms.
- **Rotas Dinâmicas:** Mapeamento de rotas de fuga com identificação de gargalos de fluxo.
- **Simulação Preventiva:** Criação de cenários de bloqueio de saídas para testar os tempos de evacuação.

### Saúde e Treinamentos

- **Validade de ASO:** Alertas automatizados para o vencimento de exames Admissionais, Periódicos e Demissionais.
- **Gestão de Turmas:** Criação de turmas coletivas para treinamentos (ex: NR-35) com emissão de certificados individuais.
- **Bloqueio Cautelar:** Impedimento de alocação de funcionários em tarefas para as quais não estão aptos.

### Inspeções e Planos

- **Checklists:** Registro de inspeções periódicas por área de risco.
- **Planos de Ação:** Painel unificado de medidas preventivas e corretivas, disparadas tanto por Ocorrências quanto por Inspeções.

---

## Arquitetura do Sistema

O SafePlace adota uma **Arquitetura Híbrida** composta por três pilares complementares:

| Pilar Arquitetural | Propósito no SafePlace |
| :--- | :--- |
| **Camadas Lógicas** | Organização macro em `Apresentação → Aplicação → Domínio → Infraestrutura` para o núcleo transacional. |
| **Fronteiras Hexagonais** | Isolamento do domínio de negócios em relação à infraestrutura externa (Banco de Dados, Sensores, ERP). |
| **Event-Driven (EDA)** | Processamento assíncrono de telemetria dos sensores IoT com latência máxima de 500 milissegundos. |

---

## Perfis de Acesso (RBAC)

**Operador**
: Registra ocorrências, consulta status dos próprios EPIs e relata incidentes preventivamente.

**Gestor de Segurança**
: Possui acesso completo e analítico. Gerencia estoques, investiga ocorrências, cria turmas de treinamento, conduz inspeções e opera o módulo de simulações.

**Administrador**
: Mantém a plataforma tecnicamente. Configura o sistema, gerencia os usuários, perfis de acesso e as integrações de hardware (sensores).

---

## Conformidade Legal

- **NR-1:** Disposições Gerais e Gerenciamento de Riscos Ocupacionais.
- **NR-6:** Equipamentos de Proteção Individual (fornecimento, registro e descarte).
- **NR-9:** Avaliação e Controle das Exposições Ocupacionais a Agentes Físicos, Químicos e Biológicos.
- **LGPD:** Lei Geral de Proteção de Dados Pessoais (Lei 13.709/2018), com criptografia AES-256 e TLS 1.3 para dados de saúde.
- **Legislação Previdenciária:** Parametrização para a correta emissão e exportação da CAT.

---

# Diagrama de Classes Conceitual

A modelagem do SafePlace está dividida em 6 grandes módulos funcionais.

![Diagrama de Classes Completo](docs/diagrams/images/DiagramaClasses.png)

## Módulo 1 — Segurança e Inspeção

| Classe | Atributos e Métodos | Relacionamentos Principais |
| :--- | :--- | :--- |
| **`ItemVerificado`** | `descricao`, `dataVerificacao`, `conforme`, `observacoes` | Associação com `Inspecao` (0..* para 1) |
| **`Inspecao`** | `dataInspecao`, `responsavel`, `conformidade`, `observacoes`<br><br>*Métodos:*<br>`obterDadosCompletos()` | Associação com `ItemVerificado` (1 para 0..*)<br>Composição com `MidiaAnexa` (1 para 0..*)<br>Associação com `AreaDeRisco` (0..* para 1..*)<br>Associação com `PlanoDeAcao` (0..* para 0..*) |
| **`GestorDeSeguranca`** | `email`, `senha`<br>*(demais atributos herdados de `Funcionario`)* | **Especialização de `Funcionario`** |
| **`AlertaComportamento`** | `dataEmissao`, `nivelGravidade`, `mensagemNotificacao`, `lidoPeloGestor` | Associação com `Funcionario` (0..* para 1) |
| **`PlanoDeAcao`** | `medidasCorretivas`, `prazo`, `status`, `medidasPreventivas`<br><br>*Métodos:*<br>`criarPlano(dados)`<br>`atualizar(novosDados)`<br>`obterDadosParaEdicao()` | Associação com `GestorDeSeguranca` (0..1 para 1)<br>Associação com `Ocorrencia` (0..* para 0..*)<br>Associação com `Inspecao` (0..* para 0..*) |

## Módulo 2 — Infraestrutura, Setores e Rotas

| Classe | Atributos e Métodos | Relacionamentos Principais |
| :--- | :--- | :--- |
| **`Sensor`** | `localizacao`, `tipo: TipoSensor` | Associação com `AreaDeRisco` (0..* para 1)<br>Associação com `AlertaSensor` (1 para 0..*)<br>Associação com `ReceptorIoT` (1..* para 0..1) |
| **`ReceptorIoT`** | `statusConexao`, `ultimoDadoRecebido`<br><br>*Métodos:*<br>`detectarTimeout()`<br>`gerarAlertaFalha(ultimoDado)`<br>`enviarDados(leitura)` | Associação com `Sensor` (0..1 para 1..*) |
| **`AlertaSensor`** | `dataEmissao`, `nivelLeitura`, `mensagem`, `lidoPeloGestor`<br><br>*Métodos:*<br>`criarAlerta(dadosLeitura)`<br>`buscarAlertasAtivos()`<br>`filtrarAlertas(criterio)` | Associação com `Sensor` (0..* para 1)<br>Associação com `GestorDeSeguranca` (0..* para 1) |
| **`AreaDeRisco`** | `nome`, `status: NivelPerigo`<br><br>*Métodos:*<br>`processarLeitura(leitura)`<br>`avaliarNivelPerigo()` | Associação com `Sensor` (1 para 0..*)<br>Associação com `Setor` (1 para 1)<br>Associação com `SimulacaoEmergencia` (1 para 1.*) |
| **`Setor`** | `nome`, `descricao`, `localizacao`, `status`<br><br>*Métodos:*<br>`obterDadosPlanta()`<br>`validarLimitesSetor()`<br>`bloquearZonaDeImpacto()`<br>`verificarRotasUteis()` | Associação com `AreaDeRisco` (1 para 1)<br>Associação com `Tarefa` (1..* para 1..*)<br>Associação com `ServicoDeRoteamento` (1 para 0.*) |
| **`SaidaEmergencia`** | `idSaida`, `capacidadeEvacuacao`, `localizacao`, `estaDesobstruida`<br><br>*Métodos:* `definirBloqueio()` | Associação com `AreaDeRisco` (0..* para 1) |
| **`ServicoDeRoteamento`** | `reguaVelocidade`, `algoritmoBusca`<br><br>*Métodos:*<br>`executarBuscaDeCaminho()`<br>`calcularTempoEstimado()`<br>`identificarGargalos()`<br>`recalcularRotas()` | Dependência `<<use>>` com `RotaSaida` e `Gargalo` |

## Módulo 3 — Funcionários e Treinamentos

| Classe | Atributos e Métodos | Relacionamentos Principais |
| :--- | :--- | :--- |
| **`Funcionario`** | `cpf`, `nome`, `dataAdmissao`, `funcao`, `classificacao`, `historicoComportamento`<br><br>*Métodos:*<br>`estaApto()`<br>`atualizarStatusAptidao()` | Associação com `Certificacao`, `AtestadoSaude`, `Treinamento`<br>**Especializado por `GestorDeSeguranca`** |
| **`Tarefa`** | `descricao`, `status`<br><br>*Métodos:*<br>`buscarTarefas()`<br>`validarAlocacaoFuncionario()`<br>`vincularEPIs(listaEPIs)`<br>`desvincularEPI(idEPI)`<br>`validarEPIsObrigatorios()` | Associação com `Setor` (1..* para 1)<br>Associação com `EPI` (1..* para 0.*) |

## Módulo 4 — Ocorrências, Incidentes e Acidentes

| Classe | Atributos e Métodos | Relacionamentos Principais |
| :--- | :--- | :--- |
| **`Ocorrencia`** | `dataOcorrencia`, `local`, `descricao`<br>*Superclasse de Incidente e Acidente*<br><br>*Métodos:*<br>`obterDadosCompletos()`<br>`vincularAnexos()`<br>`desvincularItem(idItem)`<br>`validarJustificativa(justificativa)` | Associação com `Funcionario`, `GestorDeSeguranca`, `Testemunha`, `MidiaAnexa`, `EPI`, `PlanoDeAcao` |
| **`Testemunha`** | `nome`, `documentoIdentificacao`, `depoimento`, `contato`<br><br>*Métodos:*<br>`registrarDepoimento(dados)` | Associação com `Ocorrencia` (0..* para 1) |
| **`MidiaAnexa`** | `nomeArquivo`, `tipoMidia`, `caminhoArquivo`, `dataUpload`<br><br>*Métodos:*<br>`anexarArquivo(arquivo)`<br>`validarFormatoTamanho()` | Associação com `Ocorrencia`<br>Composição com `Inspecao` |

## Módulo 5 — Inventário e Logística de EPIs

| Classe | Atributos e Métodos | Relacionamentos Principais |
| :--- | :--- | :--- |
| **`EPI`** | `ca`, `nome`, `status`, `validade`, `dataFornecimento`, `dataPrevisaoDescarte`<br><br>*Métodos:*<br>`listarDisponiveis()`<br>`obterDataValidadeCondicoes()`<br>`verificarValidadeCA()`<br>`atualizarPrevisaoDescarte()` | Composição com `Estoque`<br>Associação com `Emprestimo`, `Fornecedor`, `ProjecaoSubstituicao` |
| **`Estoque`** | `quantAtual`, `quantMinima`, `localizacao`<br><br>*Métodos:*<br>`compararComQuantidadeMinima()`<br>`validarCustoHistoricoConsumo()` | Composição com `EPI`<br>Associação com `MovimentacaoEstoque` |

---

# Diagramas de Sequência

## Descrição e Mapeamento de Métodos

Este documento garante a consistência entre os diagramas de sequência e o diagrama de classes. Todos os métodos utilizados nos diagramas de sequência correspondem exatamente aos métodos definidos nas classes do domínio.

### UC03 — Monitorar Alerta de Sensor

| Entidade / Classe | Método Utilizado |
| :--- | :--- |
| **`ReceptorIoT`** | `detectarTimeout()` |
| **`ReceptorIoT`** | `gerarAlertaFalha(ultimoDado)` |
| **`AreaDeRisco`** | `processarLeitura(leitura)` |
| **`AreaDeRisco`** | `avaliarNivelPerigo()` |
| **`AlertaSensor`** | `criarAlerta(dadosLeitura)` |
| **`AlertaSensor`** | `buscarAlertasAtivos()` |
| **`AlertaSensor`** | `filtrarAlertas(criterio)` |

![UC03 — Monitorar Alerta de Sensor](docs/diagrams/images/uc03_monitorar_alerta_sensor.png)

### UC04 — Anexar Mídias e Testemunhas

| Entidade / Classe | Método Utilizado |
| :--- | :--- |
| **`Ocorrencia`** | `obterDadosCompletos()` |
| **`Ocorrencia`** | `vincularAnexos()` |
| **`Ocorrencia`** | `validarJustificativa(justificativa)` |
| **`Ocorrencia`** | `desvincularItem(idItem)` |
| **`MidiaAnexa`** | `anexarArquivo(arquivo)` |
| **`MidiaAnexa`** | `validarFormatoTamanho()` |
| **`Testemunha`** | `registrarDepoimento(dados)` |

![UC04 — Anexar Mídias e Testemunhas](docs/diagrams/images/uc04_anexar_midias_testemunhas.png)

### UC07 — Definir Plano de Ação

| Entidade / Classe | Método Utilizado |
| :--- | :--- |
| **`Ocorrencia`** | `obterDadosCompletos(id)` |
| **`Inspecao`** | `obterDadosCompletos(id)` |
| **`PlanoDeAcao`** | `criarPlano(dados)` |
| **`PlanoDeAcao`** | `obterDadosParaEdicao()` |
| **`PlanoDeAcao`** | `atualizar(novosDados)` |

![UC07 — Definir Plano de Ação](docs/diagrams/images/uc07_definir_plano_acao.png)

### UC08 — Interligar Tarefa e EPI

| Entidade / Classe | Método Utilizado |
| :--- | :--- |
| **`Tarefa`** | `buscarTarefas()` |
| **`Tarefa`** | `vincularEPIs(listaEPIs)` |
| **`Tarefa`** | `validarAlocacaoFuncionario()` |
| **`Tarefa`** | `desvincularEPI(idEPI)` |
| **`Tarefa`** | `validarEPIsObrigatorios()` |
| **`EPI`** | `listarDisponiveis()` |
| **`EPI`** | `verificarValidadeCA()` |

![UC08 — Interligar Tarefa e EPI](docs/diagrams/images/uc08_interligar_tarefa_epi.png)
