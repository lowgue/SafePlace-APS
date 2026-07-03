# Descrição e Mapeamento dos Diagramas de Sequência

Este documento descreve os métodos utilizados em cada Diagrama de Sequência e garante a consistência (rastreabilidade) em relação ao **Diagrama de Classes Conceitual**, evitando a criação de métodos avulsos ou não mapeados.

Todos os métodos listados abaixo correspondem exatamente aos métodos definidos nas entidades do Sistema SafePlace.

---

## 1. UC03 - Monitorar Alerta de Sensor (`uc03_monitorar_alerta_sensor.puml`)

Este diagrama detalha o processo de recepção de dados, geração automática de alertas e o monitoramento pelo Gestor de Segurança. Atores externos, como o `Sensor`, não possuem métodos, comunicando-se através de mensagens/eventos (ex: "Solicitar conexão").

| Entidade / Classe | Método Utilizado | Correspondência no Diagrama de Classes |
| :--- | :--- | :--- |
| **`ReceptorIoT`** | `enviarDados(leitura)` | Sim |
| **`ReceptorIoT`** | `detectarTimeout()` | Sim |
| **`ReceptorIoT`** | `gerarAlertaFalha(ultimoDado)` | Sim |
| **`AreaDeRisco`** | `processarLeitura(leitura)` | Sim |
| **`AreaDeRisco`** | `avaliarNivelPerigo()` | Sim |
| **`AlertaSensor`** | `criarAlerta(dadosLeitura)` | Sim |
| **`AlertaSensor`** | `buscarAlertasAtivos()` | Sim |
| **`AlertaSensor`** | `filtrarAlertas(criterio)` | Sim |

*Nota sobre a dúvida de onde vem `processarLeitura`:* O método `processarLeitura(leitura)` pertence à classe `AreaDeRisco` (no Diagrama de Classes). Ele é acionado quando o `ReceptorIoT` repassa as informações lidas para a área correspondente processá-las.

---

## 2. UC04 - Anexar Mídias e Testemunhas (`uc04_anexar_midias_testemunhas.puml`)

Este diagrama detalha o processo de anexar e desvincular informações multimídia e depoimentos a uma Ocorrência já existente.

| Entidade / Classe | Método Utilizado | Correspondência no Diagrama de Classes |
| :--- | :--- | :--- |
| **`Ocorrencia`** | `obterDadosCompletos()` | Sim |
| **`Ocorrencia`** | `vincularAnexos()` | Sim |
| **`Ocorrencia`** | `validarJustificativa(justificativa)` | Sim |
| **`Ocorrencia`** | `desvincularItem(idItem)` | Sim |
| **`MidiaAnexa`** | `anexarArquivo(arquivo)` | Sim |
| **`MidiaAnexa`** | `validarFormatoTamanho()` | Sim |
| **`Testemunha`** | `registrarDepoimento(dados)` | Sim |

---

## 3. UC07 - Definir Plano de Ação (`uc07_definir_plano_acao.puml`)

Este diagrama mostra o fluxo para criar e atualizar planos de ação atrelados a uma Ocorrência ou Inspeção.

| Entidade / Classe | Método Utilizado | Correspondência no Diagrama de Classes |
| :--- | :--- | :--- |
| **`Ocorrencia`** | `obterDadosCompletos(id)`* | Sim (Variação com parâmetro id) |
| **`Inspecao`** | `obterDadosCompletos(id)`* | Sim (Variação com parâmetro id) |
| **`PlanoDeAcao`** | `criarPlano(dados)` | Sim |
| **`PlanoDeAcao`** | `obterDadosParaEdicao()` | Sim |
| **`PlanoDeAcao`** | `atualizar(novosDados)` | Sim |

*(O método obterDadosCompletos está mapeado em ambas as classes; no diagrama de sequência utiliza o identificador para resgatar a origem).*

---

## 4. UC08 - Interligar Tarefa e EPI (`uc08_interligar_tarefa_epi.puml`)

Este diagrama demonstra a listagem, associação, desvinculação e validação de Equipamentos de Proteção Individual para uma Tarefa específica.

| Entidade / Classe | Método Utilizado | Correspondência no Diagrama de Classes |
| :--- | :--- | :--- |
| **`Tarefa`** | `buscarTarefas()` | Sim |
| **`Tarefa`** | `vincularEPIs(listaEPIs)` | Sim |
| **`Tarefa`** | `validarAlocacaoFuncionario()` | Sim |
| **`Tarefa`** | `desvincularEPI(idEPI)` | Sim |
| **`Tarefa`** | `validarEPIsObrigatorios()` | Sim |
| **`EPI`** | `listarDisponiveis()` | Sim |
| **`EPI`** | `verificarValidadeCA()` | Sim |

---

### Verificação de Incongruências
**Nenhum método não-mapeado ou inventado foi encontrado**. Todos os métodos presentes nos diagramas de sequência foram rigorosamente validados e de fato existem no `diagrama_classes_completo.puml` / `DiagramaClasses.md`.
As requisições genéricas ao banco de dados e as mensagens enviadas para a interface de usuário foram descritas de forma puramente informal nos diagramas. Tais interações refletem apenas o fluxo de dados na infraestrutura do sistema, e não métodos de negócio modelados.
