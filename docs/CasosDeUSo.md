# Documentação dos Casos de Uso — SafePlace

Este documento detalha as interações entre os atores (usuários ou sistemas externos) e o sistema SafePlace, mapeando os fluxos principais, alternativos e de exceção.

---

## UC01 — Controlar Manutenção dos EPIs

**Resumo:** Descreve as etapas percorridas por um gestor de segurança para controlar a manutenção dos Equipamentos de Proteção Individual (EPIs), garantindo que estejam em condições adequadas de uso.

Atores
: **Principal:** Gestor de Segurança
: **Secundários:** Nenhum

Pré-condições
: - O gerente deve estar logado no sistema.
  - Os EPIs devem estar previamente cadastrados.

Pós-condições
: - Situação dos EPIs verificada pelo gestor.

### Fluxo Principal

| Ações do Ator                           | Ações do Sistema                                       |
| :-------------------------------------- | :----------------------------------------------------- |
| Acessar o módulo de EPIs                | Exibir a lista de EPIs cadastrados com seus status     |
| Consultar detalhes de um EPI específico | Exibir histórico e datas de manutenção                 |
| Analisar a situação                     | —                                                      |

> **Regras de Negócio e Validações:** Deve haver clareza visual nos indicadores de status dos equipamentos. Apenas EPIs ativos devem ser exibidos.

### Cenário Alternativo I — Filtrar EPIs por status

| Ações do Ator                                              | Ações do Sistema                    |
| :--------------------------------------------------------- | :---------------------------------- |
| Acessar filtros                                            | —                                   |
| Selecionar um critério (ex: vencidos, próximos da manutenção) | Atualizar a lista exibida         |

### Cenário de Exceção I — EPI não encontrado

| Ações do Ator               | Ações do Sistema                              |
| :-------------------------- | :-------------------------------------------- |
| Tentar acessar um EPI       | Não encontrar o registro e exibir mensagem de erro |
| —                           | Permitir nova busca                           |

---

## UC02 — Controlar Certificações e Treinamentos

**Resumo:** Monitoramento das certificações dos funcionários, bem como os treinamentos realizados ou pendentes. O sistema gera alertas quando as certificações vencerem ou for necessário treinamento.

Atores
: **Principal:** Gestor de Segurança
: **Secundários:** Funcionário

Pré-condições
: - O Gestor de Segurança deve estar logado.
  - Os dados dos funcionários devem estar cadastrados.

Pós-condições
: - Exibição das certificações e treinamentos feitos ou pendentes.
  - Emissão de alertas de vencimento ou pendência.

### Fluxo Principal

| Ações do Ator                                    | Ações do Sistema                                                         |
| :----------------------------------------------- | :----------------------------------------------------------------------- |
| Acessar o menu "Certificações e Treinamentos"    | Carregar tela com listagem de funcionários e suas certificações          |
| Selecionar um funcionário                        | Exibir detalhes das certificações e treinamentos do funcionário          |
| Visualizar certificações e treinamentos          | —                                                                        |

> **Regras de Negócio e Validações:** O sistema deve alertar automaticamente quando uma certificação estiver próxima do vencimento. A interface deve sempre exibir dados atualizados.

### Cenário Alternativo I — O funcionário possui certificados vencidos

| Ações do Ator | Ações do Sistema                                                       |
| :------------ | :--------------------------------------------------------------------- |
| —             | Identificar certificações vencidas e destacar a necessidade de renovação |
| —             | Emitir alerta que certificados necessitam de renovação                 |

### Cenário Alternativo II — O funcionário possui treinamentos pendentes

| Ações do Ator | Ações do Sistema                                                       |
| :------------ | :--------------------------------------------------------------------- |
| —             | Identificar e destacar treinamentos pendentes                          |
| —             | Emitir alerta indicando a pendência                                    |

### Cenário Alternativo III — Funcionário sem certificações cadastradas

| Ações do Ator | Ações do Sistema                                              |
| :------------ | :------------------------------------------------------------ |
| —             | Verificar existência de certificações e não encontrar registros |
| —             | Exibir mensagem: "Funcionário sem certificações cadastradas"  |

### Cenário de Exceção I — Falha de conexão com o banco de dados

| Ações do Ator | Ações do Sistema                        |
| :------------ | :-------------------------------------- |
| —             | Tentar conexão com banco                |
| —             | Detectar falha de conexão e exibir erro de indisponibilidade |
| —             | Registrar erro no log do sistema        |

---

## UC03 — Monitorar Alerta do Sensor

**Resumo:** Permite ao Gestor monitorar alertas gerados automaticamente pelo sistema a partir de sensores IoT, identificando situações de risco ou incidentes em tempo real.

Atores
: **Principal:** Gestor de Segurança
: **Secundários:** Sensor (sistema externo / hardware)

Pré-condições
: - Os sensores devem estar instalados, conectados e enviando dados.
  - O gestor deve estar autenticado no sistema.

Pós-condições
: - Os alertas são visualizados pelo gestor e registrados historicamente no sistema.

### Fluxo Principal

| Ações do Ator                              | Ações do Sistema                                                          |
| :----------------------------------------- | :------------------------------------------------------------------------ |
| —                                          | O sensor detecta uma situação de risco e envia dados ao sistema           |
| —                                          | O sistema recebe, processa os dados e identifica a situação de risco      |
| —                                          | O sistema gera automaticamente um registro de `AlertaSensor` e o armazena |
| O gestor seleciona monitorar alertas       | O sistema exibe a listagem de registros `AlertaSensor` ativos             |
| O gestor analisa os alertas                | —                                                                         |

> **Regras de Negócio e Validações:** Registros de `AlertaSensor` devem ser gerados automaticamente sempre que os dados indicarem risco crítico. Todos os alertas devem ser armazenados para fins de auditoria (data, horário, sensor, leitura e nível). Caso haja falha na comunicação com o sensor, o sistema deve registrar o erro.

### Cenário Alternativo I — Filtrar Alertas por Critério

| Ações do Ator                                              | Ações do Sistema                                                                      |
| :--------------------------------------------------------- | :------------------------------------------------------------------------------------ |
| O gestor aciona o painel de filtros                        | Exibe as opções: nível de risco, sensor, data/hora, status                            |
| O gestor seleciona um critério e confirma                  | Atualiza a listagem exibindo apenas os alertas correspondentes                        |

### Cenário de Exceção I — Falha de Comunicação com o Sensor

| Ações do Ator                                              | Ações do Sistema                                                                              |
| :--------------------------------------------------------- | :-------------------------------------------------------------------------------------------- |
| —                                                          | Detecta timeout na comunicação e registra no log                                              |
| —                                                          | Gera alerta de falha de comunicação exibindo o último dado recebido                           |
| O gestor tenta reconectar o sensor                         | Tenta restabelecer a comunicação e informa o resultado                                        |
| —                                                          | Marca o sensor como indisponível até o restabelecimento                                       |

---

## UC04 — Anexar Mídias e Testemunhas

**Resumo:** Permite anexar evidências a uma ocorrência (acidente ou incidente) já registrada, enriquecendo o relatório com fotos, vídeos, documentos e relatos de testemunhas.

Atores
: **Principal:** Gestor de Segurança
: **Secundários:** Nenhum

Pré-condições
: - A ocorrência já deve estar cadastrada.

Pós-condições
: - O registro da ocorrência é atualizado com mídias e/ou testemunhas vinculadas.

### Fluxo Principal

| Ações do Ator                                    | Ações do Sistema                                                                 |
| :----------------------------------------------- | :------------------------------------------------------------------------------- |
| O gestor acessa uma ocorrência existente         | —                                                                                |
| Seleciona anexar mídias/testemunhas              | Apresenta opções de upload de arquivos e formulário de testemunhas               |
| Insere os dados desejados                        | Valida os arquivos/informações e vincula os dados à ocorrência                   |

### Cenário Alternativo I — Remover Mídia ou Testemunha Já Anexada

| Ações do Ator                                                      | Ações do Sistema                                                                                                          |
| :----------------------------------------------------------------- | :------------------------------------------------------------------------------------------------------------------------ |
| Seleciona o item que deseja remover e confirma a justificativa     | Valida a justificativa (obrigatória) e remove o vínculo                                                                   |
| —                                                                  | Registra no histórico da ocorrência a remoção e atualiza a interface                                                      |

### Cenário de Exceção I — Arquivo com Formato ou Tamanho Inválido

| Ações do Ator                                              | Ações do Sistema                                                                                         |
| :--------------------------------------------------------- | :------------------------------------------------------------------------------------------------------- |
| Seleciona um arquivo para upload                           | Detecta que o formato (JPG, PDF, etc) ou tamanho não é permitido                                         |
| —                                                          | Rejeita o arquivo, exibe mensagem de erro e orientações                                                  |

---

## UC05 — Gerenciar Ocorrências

**Resumo:** Gerencia o ciclo de vida completo de ocorrências (tanto acidentes com lesão quanto incidentes preventivos) causadas por falhas humanas ou de EPIs.

Atores
: **Principal:** Gestor de Segurança

Pré-condições
: - O Gestor deve estar autenticado.

Pós-condições
: - A ocorrência fica registrada, podendo ser consultada e utilizada para análises de risco.

### Fluxo Principal

| Ações do Ator                            | Ações do Sistema                                                                   |
| :--------------------------------------- | :--------------------------------------------------------------------------------- |
| Acessa o gerenciamento de ocorrências    | Apresenta as opções (cadastrar, consultar, editar ou arquivar ocorrência)          |
| Escolhe cadastrar ocorrência             | Solicita os dados da ocorrência                                                    |
| Preenche as informações                  | Valida e registra a ocorrência no banco de dados                                   |
| —                                        | Executa o sub-fluxo **UC04** para anexar evidências                                |

> **Regras de Negócio e Validações:** A ocorrência deve ser vinculada a um funcionário. O sistema registra automaticamente data e horário do cadastro (trilha de auditoria). O registro raiz não pode ser apagado fisicamente do banco de dados (exclusão lógica/arquivamento).

### Cenário Alternativo I — Consultar Ocorrência Existente

| Ações do Ator                                         | Ações do Sistema                                                                                              |
| :---------------------------------------------------- | :------------------------------------------------------------------------------------------------------------ |
| Seleciona a opção 'Consultar ocorrência'              | Exibe campo de busca e filtros (funcionário, data, tipo, status)                                              |
| Informa critérios e confirma                          | Busca e exibe a lista resumida correspondente                                                                 |
| Seleciona uma ocorrência da lista                     | Exibe os detalhes completos (mídias, testemunhas e plano de ação)                                             |

---

## UC06 — Controlar Estoque de EPIs

**Resumo:** Controle logístico dos Equipamentos de Proteção Individual, permitindo cadastrar itens, visualizar saldos e monitorar níveis de reposição mínimos.

Atores
: **Principal:** Gestor de Segurança

Pré-condições
: - O Gestor deve estar autenticado.

Pós-condições
: - O sistema exibe o estoque atualizado e registra transacionalmente as alterações.

### Fluxo Principal

| Ações do Ator              | Ações do Sistema                         |
| :------------------------- | :--------------------------------------- |
| Acessar o menu "Estoque"   | Carregar listagem de EPIs disponíveis    |
| Selecionar um EPI          | Exibir detalhes do item (nome, saldo, status) |
| Atualizar quantidade       | Validar dados informados                 |
| Confirmar atualização      | Atualizar estoque no sistema             |

> **Regras de Negócio e Validações:** EPIs com quantidade abaixo do nível mínimo devem ser destacados na interface. O estoque não pode assumir saldo negativo.

### Cenário Alternativo I — Estoque vazio

| Ações do Ator | Ações do Sistema                                       |
| :------------ | :----------------------------------------------------- |
| —             | Verificar itens e não encontrar cadastros              |
| —             | Exibir mensagem: "Nenhum EPI cadastrado no sistema"    |

### Cenário de Exceção I — Falha ao atualizar estoque

| Ações do Ator              | Ações do Sistema              |
| :------------------------- | :---------------------------- |
| Atualizar quantidade de EPI | Tentar salvar e detectar erro de integridade (ex: concorrência) |
| —                          | Cancelar a transação e exibir mensagem de erro |

---

## UC07 — Definir Plano de Ação (Ocorrências e Inspeções)

**Resumo:** Estabelecimento de medidas corretivas e preventivas de forma unificada, gerando Planos de Ação que podem nascer de uma Ocorrência ou de uma Inspeção de campo.

Atores
: **Principal:** Gestor de Segurança

Pré-condições
: - A ocorrência ou a inspeção de origem deve estar registrada.

Pós-condições
: - Plano de ação unificado registrado e monitorado pelo sistema.

### Fluxo Principal

| Ações do Ator                                      | Ações do Sistema                                                             |
| :------------------------------------------------- | :--------------------------------------------------------------------------- |
| Acessar o painel de Planos de Ação                 | Exibe pendências geradas por Ocorrências ou Inspeções                        |
| Selecionar um evento gerador                       | Exibir os detalhes do evento origem                                          |
| Definir ações, prazos e responsáveis               | Valida os dados e salva o plano, vinculando-o à origem polimórfica           |

### Cenário Alternativo I — Atualizar plano de ação existente

| Ações do Ator            | Ações do Sistema        |
| :----------------------- | :---------------------- |
| Acessar plano existente  | Carrega o formulário    |
| Alterar o status/prazo   | Registra no histórico e salva novas alterações |

### Cenário de Exceção I — Origem não encontrada

| Ações do Ator                              | Ações do Sistema             |
| :----------------------------------------- | :--------------------------- |
| Tentar acessar um evento de origem excluído| Retorna erro 404 lógico      |
| —                                          | Exibe erro e retorna à lista |

---

## UC08 — Interligar Tarefa ao EPI

**Resumo:** Associação mandatória entre as tarefas/atividades exercidas pela equipe e os Equipamentos de Proteção Individual necessários para a execução segura.

Atores
: **Principal:** Gestor de Segurança

Pré-condições
: - EPIs e Tarefas previamente cadastrados.

Pós-condições
: - Matriz de risco da tarefa vinculada a um ou mais EPIs obrigatórios.

### Fluxo Principal

| Ações do Ator                    | Ações do Sistema                           |
| :------------------------------- | :----------------------------------------- |
| Acessar o módulo de tarefas      | Exibir a lista de tarefas cadastradas      |
| Selecionar uma tarefa            | Apresentar lista de EPIs disponíveis       |
| Selecionar e confirmar a associação | Validar os dados e persistir a matriz   |

---

## UC09 — Simular Cenários de Emergência

**Resumo:** Permite simular cenários virtuais de abandono de área nas plantas cadastradas, bloqueando rotas de fuga e validando algoritmos de gargalo e tempo de resposta.

Atores
: **Principal:** Gestor de Segurança

Pré-condições
: - As áreas de risco e rotas de emergência devem estar mapeadas (infraestrutura).

Pós-condições
: - Relatório de eficácia e identificação de gargalos (vulnerabilidades estruturais).

### Fluxo Principal

| Ações do Ator                              | Ações do Sistema                                                                                              |
| :----------------------------------------- | :------------------------------------------------------------------------------------------------------------ |
| Acessar o módulo de simulação              | Carrega o mapa base digitalizado da empresa                                                                   |
| Seleciona o local de origem do sinistro    | Valida limites do setor e saídas disponíveis                                                                  |
| —                                          | Bloqueia virtualmente as saídas de emergência diretamente afetadas                                            |
| —                                          | Executa algoritmo de pathfinding (busca de caminhos) para todos os perfis na zona de impacto                  |
| —                                          | Projeta rotas alternativas e identifica gargalos de fluxo (excesso de capacidade)                             |
| Finaliza a simulação                       | Gera relatório comparativo entre cenário ideal vs cenário obstruído                                           |

> **Regras de Negócio e Validações:** O cálculo de gargalos baseia-se na velocidade média de 1,2 m/s para adultos. O motor suporta até 500 perfis simultâneos por planta física.

### Cenário Alternativo I — Alteração de variáveis em tempo real

| Ações do Ator                                                      | Ações do Sistema                                                       |
| :----------------------------------------------------------------- | :--------------------------------------------------------------------- |
| Bloqueia manualmente uma saída extra no mapa                       | Aplica o bloqueio e recalcula rotas de fuga disponíveis em tempo real  |
| —                                                                  | Atualiza a projeção gráfica no mapa instantaneamente                   |

### Cenário de Exceção I — Cenário sem saída (Falha Crítica)

| Ações do Ator | Ações do Sistema                                            |
| :------------ | :---------------------------------------------------------- |
| —             | Identifica bloqueio de 100% das rotas viáveis               |
| —             | Emite alerta crítico de falha de projeto estrutural         |

---

## UC10 — Planejar Substituição Inteligente de EPI

**Resumo:** Gestão preditiva do ciclo de vida dos EPIs. Automatiza o cálculo de desgaste cruzando validade do CA, matriz de risco e frequência de uso.

Atores
: **Principal:** Gestor de Segurança

Pré-condições
: - Histórico de alocação de EPIs atualizado.

Pós-condições
: - Geração autônoma de requisições de reposição para itens em estado crítico.

### Fluxo Principal

| Ações do Ator                                  | Ações do Sistema                                                                                                                             |
| :--------------------------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------- |
| Acessar a "Análise de Projeção de Desgaste"    | Analisa a frequência de uso dos EPIs em campo                                                                                                |
| —                                              | Cruza a durabilidade nominal com multiplicadores de desgaste (matriz de risco)                                                               |
| —                                              | Verifica se a validade do CA (Certificado de Aprovação) inserida internamente será atingida                                                  |
| Analisa a lista de projeções geradas           | Emite lista de reposição prioritária para EPIs no limite de segurança                                                                        |
| —                                              | Gera requisição de compra automática no almoxarifado                                                                                         |

> **Regras de Negócio e Validações:** A validade do CA tem prioridade absoluta: se vencer, o EPI é descartado indepedente da conservação física. O sistema aplica multiplicadores de desgaste físico (0,5x a 1,5x) com base na agressividade do setor. Rotina batch processada a cada 24 horas.

### Cenário Alternativo I — Prorrogação por inspeção física

| Ações do Ator                                                    | Ações do Sistema                                                                      |
| :--------------------------------------------------------------- | :------------------------------------------------------------------------------------ |
| Realiza inspeção e insere "aval técnico" confirmando integridade | Estende a data de descarte no cálculo (limitado pela expiração do CA)                 |

### Cenário de Exceção I — EPI com CA Expirado em Uso (Risco Legal)

| Ações do Ator | Ações do Sistema                                                                                                                                  |
| :------------ | :------------------------------------------------------------------------------------------------------------------------------------------------ |
| —             | Detecta uso ativo de EPI com CA expirado                                                                                                          |
| —             | Gera notificação severa no painel, exigindo substituição imediata e bloqueando tarefa do funcionário                                              |
