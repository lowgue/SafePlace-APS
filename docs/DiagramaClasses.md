# Diagrama de Classes Conceitual — SafePlace

> **Acesso ao Modelo Original:** [Visualizar diagrama no Google Drive](https://drive.google.com/file/d/11Dlp0f2jS6RFaou4GOPT2ptH0Kf_OZFB/view?usp=sharing)

---

## Estrutura do Domínio

A modelagem do SafePlace está dividida em 6 grandes módulos funcionais. Abaixo está o detalhamento estrutural de cada um deles, evidenciando atributos, métodos e relacionamentos conforme a versão final do diagrama.

---

### 1. Módulo de Segurança e Inspeção

| Classe | Atributos e Métodos | Relacionamentos Principais |
| :--- | :--- | :--- |
| **`ItemVerificado`** | `descricao`, `dataVerificacao`, `conforme`, `observacoes` | Associação com `Inspecao` (0..* para 1) |
| **`Inspecao`** | `dataInspecao`, `responsavel`, `conformidade`, `observacoes`<br><br>*Métodos:*<br>`obterDadosCompletos()` | Associação com `ItemVerificado` (1 para 0..*)<br>Associação com `GestorDeSeguranca` (0..* para 1)<br>Composição com `MidiaAnexa` (1 para 0..*)<br>Associação com `AreaDeRisco` (0..* para 1..*)<br>Associação com `PlanoDeAcao` (0..* para 0..*) |
| **`GestorDeSeguranca`** | `email`, `senha`<br>*(demais atributos herdados de `Funcionario`)* | **Especialização de `Funcionario`**<br>Associação com `Inspecao` (1 para 0..*)<br>Associação com `AlertaComportamento` (1 para 0..*)<br>Associação com `PlanoDeAcao` (1 para 0..1)<br>Associação com `Ocorrencia` (1 para 0..*)<br>Associação com `AreaDeRisco` (1 para 1..*)<br>Associação com `AlertaSensor` (1 para 0..*)<br>Associação com `Treinamento` (1 para 1)<br>Associação com `MovimentacaoEstoque` (1 para 0..*) |
| **`AlertaComportamento`** | `dataEmissao`, `nivelGravidade`, `mensagemNotificacao`, `lidoPeloGestor`<br><br>*Nota: Registro estrito do comportamento inadequado de um funcionário (ex: não uso de EPI), sem ligação a sensores.* | Associação com `Funcionario` (0..* para 1) |
| **`PlanoDeAcao`** | `medidasCorretivas`, `prazo`, `status`, `medidasPreventivas`<br><br>*Métodos:*<br>`criarPlano(dados)`<br>`atualizar(novosDados)`<br>`obterDadosParaEdicao()` | Associação com `GestorDeSeguranca` (0..1 para 1)<br>Associação com `Ocorrencia` (0..* para 0..*)<br>Associação com `Inspecao` (0..* para 0..*) |

---

### 2. Módulo de Infraestrutura, Setores e Rotas

| Classe | Atributos e Métodos | Relacionamentos Principais |
| :--- | :--- | :--- |
| **`Sensor`** | `localizacao`, `tipo: TipoSensor` | Associação com `AreaDeRisco` (0..* para 1)<br>Associação com `AlertaSensor` (1 para 0..*)<br>Associação com `ReceptorIoT` (1..* para 0..1) |
| **`ReceptorIoT`** | `statusConexao`, `ultimoDadoRecebido`<br><br>*Métodos:*<br>`detectarTimeout()`<br>`gerarAlertaFalha(ultimoDado)`<br>`enviarDados(leitura)` | Associação com `Sensor` (0..1 para 1..*) |
| **`AlertaSensor`** | `dataEmissao`, `nivelLeitura`, `mensagem`, `lidoPeloGestor`<br><br>*Métodos:*<br>`criarAlerta(dadosLeitura)`<br>`buscarAlertasAtivos()`<br>`filtrarAlertas(criterio)` | Associação com `Sensor` (0..* para 1)<br>Associação com `GestorDeSeguranca` (0..* para 1) |
| **`AreaDeRisco`** | `nome`, `status: NivelPerigo`<br><br>*Métodos:*<br>`processarLeitura(leitura)`<br>`avaliarNivelPerigo()` | Associação com `Sensor` (1 para 0..*)<br>Associação com `Tarefa` (0..1 para 0..*)<br>Associação com `Setor` (1 para 1)<br>Associação com `SimulacaoEmergencia` (1 para 1..*)<br>Associação com `SaidaEmergencia` (1 para 0..*)<br>Associação com `Inspecao` (1..* para 0..*)<br>Associação com `Ocorrencia` (0..1 para 0..*)<br>Associação com `GestorDeSeguranca` (1..* para 1) |
| **`Setor`** | `nome`, `descricao`, `localizacao`, `status`<br><br>*Métodos:*<br>`obterDadosPlanta()`<br>`validarLimitesSetor()`<br>`validarSaidasCadastradas()`<br>`bloquearZonaDeImpacto()`<br>`verificarRotasUteis()`<br>`aplicarBloqueioTotais()` | Associação com `AreaDeRisco` (1 para 1)<br>Associação com `Tarefa` (1..* para 1..*)<br>Associação com `ServicoDeRoteamento` (1 para 0..*)<br>Associação com `Funcionario` (1..* para 0..*) |
| **`SaidaEmergencia`** | `idSaida`, `capacidadeEvacuacao`, `localizacao`, `estaDesobstruida`<br><br>*Métodos:* `definirBloqueio()` | Associação com `AreaDeRisco` (0..* para 1)<br>Associação com `SimulacaoEmergencia` (0..* para 1) |
| **`SimulacaoEmergencia`** | `idSimulacao`, `dataRealizacao`, `tempoEvacuacaoPrat`, `eficacia` | Associação com `AreaDeRisco` (0..* para 1)<br>Associação com `Vulnerabilidade` (0..* para 1)<br>Associação com `SaidaEmergencia` (1 para 0..*) |
| **`Vulnerabilidade`** | `descricao`, `local` | Associação com `SimulacaoEmergencia` (1 para 0..*) |
| **`ServicoDeRoteamento`** | `reguaVelocidade`, `algoritmoBusca`<br><br>*Métodos:*<br>`executarBuscaDeCaminho()`<br>`calcularTempoEstimado()`<br>`identificarGargalos()`<br>`recalcularRotas()`<br>`gerarComparativoRealESimulado()` | Associação com `Setor` (0..* para 1)<br>Dependência `<<use>>` com `RotaSaida`<br>Dependência `<<use>>` com `Gargalo` |
| **`RotaSaida`** | `caminho`, `distanciaTotal`, `tempoEstimado`, `status`<br><br>*Métodos:*<br>`calcularTempoEstimado()`<br>`estaBloqueada()` | Composição com `Gargalo` (1 para 0..*)<br>Usada por `ServicoDeRoteamento` via dependência `<<use>>` |
| **`Gargalo`** | `localizacao`, `descricao`, `gravidade` | Composição com `RotaSaida` (0..* para 1, com `RotaSaida` como Todo)<br>Usado por `ServicoDeRoteamento` via dependência `<<use>>` |

---

### 3. Módulo de Funcionários e Treinamentos

| Classe | Atributos e Métodos | Relacionamentos Principais |
| :--- | :--- | :--- |
| **`Funcionario`** | `cpf`, `nome`, `dataAdmissao`, `funcao`, `classificacao`, `historicoComportamento`<br><br>*Métodos:*<br>`estaApto()`<br>`atualizarStatusAptidao()`<br><br>*Nota: `GestorDeSeguranca` é uma especialização desta classe.* | Associação com `Certificacao` (1 para 0..*)<br>Associação com `AtestadoSaude` (1 para 0..*)<br>Associação com `Treinamento` (1..* para 0..*)<br>Associação com `Tarefa` (1..* para 1)<br>Associação com `Ocorrencia` (1 para 0..*)<br>Associação com `Emprestimo` (1 para 0..*)<br>Associação com `AlertaComportamento` (1 para 0..*)<br>Associação com `Setor` (1 para 1..*)<br>**Especializado por `GestorDeSeguranca`** |
| **`Certificacao`** | `nome`, `status`, `dataVencimento`, `dataEmissao` | Associação com `Funcionario` (0..* para 1)<br>Associação com `Treinamento` (1..* para 1) |
| **`AtestadoSaude`** | `dataEmissao`, `tipo`, `dataVencimento`, `apto` | Associação com `Funcionario` (1..* para 1) |
| **`Treinamento`** | `nome`, `conteudo`, `instrutor`, `dataRealizacao`, `cargaHoraria` | Associação com `Funcionario` (0..* para 0..*)<br>Associação com `Certificacao` (1 para 1..*)<br>Associação com `GestorDeSeguranca` (1 para 0..*) |
| **`Tarefa`** | `descricao`, `status`<br><br>*Métodos:*<br>`buscarTarefas()`<br>`validarAlocacaoFuncionario()`<br>`vincularEPIs(listaEPIs)`<br>`desvincularEPI(idEPI)`<br>`validarEPIsObrigatorios()` | Associação com `Setor` (1..* para 1)<br>Associação com `AreaDeRisco` (0..* para 0..1)<br>Associação com `Ocorrencia` (0..1 para 0..*)<br>Associação com `EPI` (1..* para 0..*) |

---

### 4. Módulo de Ocorrências, Incidentes e Acidentes

| Classe | Atributos e Métodos | Relacionamentos Principais |
| :--- | :--- | :--- |
| **`Ocorrencia`** | `dataOcorrencia`, `local`, `descricao`<br>*Superclasse de Incidente e Acidente*<br><br>*Métodos:*<br>`obterDadosCompletos()`<br>`vincularAnexos()`<br>`desvincularItem(idItem)`<br>`validarJustificativa(justificativa)` | Associação com `Funcionario` (0..* para 1)<br>Associação com `GestorDeSeguranca` (0..* para 1)<br>Associação com `Testemunha` (1 para 0..*)<br>Associação com `MidiaAnexa` (1 para 0..*)<br>Associação com `AreaDeRisco` (0..* para 0..1)<br>Associação com `EPI` (0..* para 0..*)<br>Associação com `Tarefa` (0..* para 0..1)<br>Associação com `PlanoDeAcao` (0..* para 0..*) |
| **`Incidente`** | `potencialDano` | Herda de `Ocorrencia` |
| **`Acidente`** | `causaRaiz`, `tipo` | Herda de `Ocorrencia`<br>Associação com `CAT` (1 para 0..1) |
| **`CAT`** | `numeroProtocolo`, `destino` | Associação com `Acidente` (0..1 para 1)<br>Associação com `OrgaoDestino` (1..* para 1) |
| **`OrgaoDestino`** | `nome`, `cnpj`, `endereco` | Associação com `CAT` (1 para 1..*) |
| **`Testemunha`** | `nome`, `documentoIdentificacao`, `depoimento`, `contato`<br><br>*Métodos:*<br>`registrarDepoimento(dados)` | Associação com `Ocorrencia` (0..* para 1) |
| **`MidiaAnexa`** | `nomeArquivo`, `tipoMidia`, `caminhoArquivo`, `dataUpload`<br><br>*Métodos:*<br>`anexarArquivo(arquivo)`<br>`validarFormatoTamanho()` | Associação com `Ocorrencia` (0..* para 1)<br>Composição com `Inspecao` (0..* para 1, com `Inspecao` como Todo) |

---

### 5. Módulo de Inventário e Logística de EPIs

| Classe | Atributos e Métodos | Relacionamentos Principais |
| :--- | :--- | :--- |
| **`Emprestimo`** | `dataRetirada`, `dataDevolucaoPrevista`, `dataDevolucaoReal`, `status`<br><br>*Métodos:* `obterHistoricoUsoFrequencia()` | Associação com `Funcionario` (0..* para 1)<br>Associação com `EPI` (0..* para 1) |
| **`EPI`** | `ca`, `nome`, `status`, `validade`, `dataFornecimento`, `dataPrevisaoDescarte`<br><br>*Métodos:*<br>`listarDisponiveis()`<br>`obterDataValidadeCondicoes()`<br>`verificarValidadeCA()`<br>`atualizarPrevisaoDescarte()` | Associação com `Emprestimo` (1 para 0..*)<br>Associação com `Fornecedor` (1..* para 1..*)<br>Composição com `Estoque` (1..* para 1, com `Estoque` como Todo)<br>Associação com `ProjecaoSubstituicao` (1 para 0..*)<br>Associação com `Manutencao_EPI` (1 para 0..*)<br>Associação com `Tarefa` (1 para 0..*)<br>Associação com `Ocorrencia` (0..* para 0..*) |
| **`Fornecedor`** | `cnpj`, `razaoSocial`, `representante`, `email`, `telefone` | Associação com `EPI` (1..* para 1..*)<br>Associação com `EntradaEstoque` (1 para 0..*) |
| **`EntradaEstoque`** | `numeroNf`, `dataFiscal`, `valorUnitario` | Associação com `Fornecedor` (0..* para 1)<br>Herda de `MovimentacaoEstoque` |
| **`MovimentacaoEstoque`** | `data`, `quantidade`, `situacao`, `motivo`<br><br>*Métodos:* `atualizarQuantidadeMovimentada()` | Associação com `Estoque` (0..* para 1)<br>Associação com `GestorDeSeguranca` (0..* para 1) |
| **`Estoque`** | `quantAtual`, `quantMinima`, `localizacao`<br><br>*Métodos:*<br>`compararComQuantidadeMinima()`<br>`validarCustoHistoricoConsumo()` | Composição com `EPI` (1 para 1..*, com `Estoque` como Todo)<br>Associação com `MovimentacaoEstoque` (1 para 0..*) |
| **`ProjecaoSubstituicao`** | `dataProjecao`, `dataEstimadaDescarte`, `quantidadeCalculada`, `justificativa` | Associação com `EPI` (0..* para 1) |
| **`Manutencao_EPI`** | `dataManutencao`, `descricaoManutencao`, `resultadoManutencao` | Associação com `EPI` (0..* para 1) |

---

### 6. Enums (Enumeradores estruturais)

| Enumeração | Valores Possíveis |
| :--- | :--- |
| **`ClassificacaoEmprestimo`** | Aberto, Disponível, Em uso, EmDevolucao |
| **`EstadoManutencao`** | Na validade, Em manutenção, Fora da validade |
| **`ClassificacaoEPI`** | Proteção contra quedas, Proteção de membros inferiores, Proteção de membros superiores, Proteção de tronco, Proteção respiratória, Proteção auditiva, Proteção dos olhos, Proteção da face, Proteção da cabeça |
| **`StatusFuncionario`** | Indisponível, Disponível, Em tarefa, Em férias, Afastado |
| **`NivelPerigo`** | Baixo, Médio, Crítico |
| **`TipoSensor / Propriedades Físicas`** | Presença e Proximidade, Gases, Qualidade do ar, Ambientes, Movimento, Vibração, Radiação |
