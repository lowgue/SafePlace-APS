# Requisitos Funcionais — SafePlace

## Membros do Grupo

| Nome                          | Matrícula    |
| ----------------------------- | ------------ |
| Mariana Ferrão Chuquel        | 2510101614   |
| Tauani Ximenes Sauceda        | 2510101047   |
| Rafaela de Menezes            | 2510101621   |
| Izabel de Oliveira Boaventura | 2510101632   |
| Luan Martins                  | 2410100679   |

- **Disciplina:** Análise e Projeto de Software
- **Docente:** Gilleanes Thorwald Araujo Guedes

---

## Requisitos Funcionais

### RF01 — Gerenciar acidentes causados por funcionário

O Sistema deve gerenciar os acidentes causados por um funcionário.

> Este requisito refere-se a acidentes causados individualmente por funcionários, sem a interferência de outros fatores. Por exemplo: quando um funcionário causa um acidente por não estar utilizando o EPI corretamente ou por não estar o utilizando.

---

### RF02 — Gerenciar acidentes causados por falha de equipamento

O Sistema deve gerenciar os acidentes causados por uma falha de equipamento de segurança.

> Este requisito refere-se a acidentes causados por equipamentos de segurança individual (EPIs), ou seja, quando o estado do EPI não está nos conformes.

---

### RF03 — Controlar estoque de EPIs

O Sistema deve controlar o estoque dos EPIs.

> Este requisito refere-se ao controle de quais equipamentos estão sendo utilizados, suas quantidades e seu estado de manutenção em relação à qualidade de proteção.

---

### RF04 — Controlar manutenção de EPIs

O Sistema deve controlar a manutenção dos EPIs.

> Este requisito refere-se ao controle do estado de manutenção em relação à qualidade de proteção dos EPIs que estão sendo utilizados e dos que estão armazenados no estoque.

---

### RF05 — Mapear áreas de risco

O Sistema deve mapear as áreas de risco do ambiente de trabalho.

> Este requisito refere-se ao mapeamento das áreas internas do ambiente de trabalho, a fim de analisar quais áreas apresentam riscos de acidentes.

---

### RF06 — Classificar nível de periculosidade da tarefa

O Sistema deve permitir classificar o nível de periculosidade da tarefa a ser realizada.

> Este requisito refere-se ao nível de perigo que uma determinada tarefa aponta a um funcionário.

---

### RF07 — Informar plano de ação por acidente

O Sistema deve permitir informar o plano de ação para cada tipo de acidente ocorrido.

> Este requisito refere-se ao que deve ser feito mediante um acidente ocorrido.

---

### RF08 — Gerar alertas automáticos por comportamento de risco

O sistema deve gerar alertas automáticos quando um funcionário acumular ocorrências de comportamento de risco.

> Este requisito refere-se à análise do histórico de ações de um determinado funcionário, mapeando as suas ocorrências acima de um limite configurável, acionando revisão obrigatória de conduta.

---

### RF09 — Registrar histórico de inspeções periódicas

O sistema deve registrar o histórico de inspeções periódicas das áreas de risco.

> Este requisito refere-se ao controle das inspeções necessárias em áreas de risco de acidentes, com o objetivo de indicar conformidade ou não conformidade com as normas regulamentadoras (NRs) aplicáveis.

---

### RF10 — Correlacionar acidentes com tarefas, áreas e equipamentos

O sistema deve correlacionar automaticamente acidentes com as tarefas, áreas e equipamentos envolvidos.

> Este requisito refere-se à união das informações de cada acidente ocorrido, identificando padrões recorrentes que indiquem causas sistêmicas.

---

### RF11 — Controlar vencimento de certificações e treinamentos

O sistema deve controlar o vencimento das certificações e treinamentos obrigatórios dos funcionários.

> Este requisito refere-se ao controle das certificações e treinamentos obrigatórios de cada funcionário, bloqueando a alocação em tarefas que exijam habilitação não renovada.

---

### RF12 — Controlar rastreabilidade dos EPIs

O sistema deve controlar a rastreabilidade dos EPIs (equipamentos de segurança individual).

> Este requisito refere-se ao controle dos equipamentos que estão disponíveis para uso, sendo utilizados ou que não foram devolvidos na data determinada.

---

### RF13 — Monitorar sensores e gerenciar protocolos de emergência

O sistema deve monitorar sensores ambientais e gerenciar protocolos de emergência com rotas de fuga dinâmicas.

> Este requisito refere-se à capacidade do sistema de monitorar sensores em tempo real e, ao detectar níveis críticos de perigo, ativar automaticamente alarmes e notificações. Simultaneamente, o sistema deve mapear e calcular o caminho mais seguro para as saídas de emergência, bloqueando áreas de risco e orientando os usuários individualmente.

---

### RF14 — Conectar tarefas aos EPIs

O sistema deve permitir a conexão entre as tarefas e os EPIs.

> Este requisito refere-se à interligação entre tarefas e seus devidos EPIs, ou seja, os que devem ser utilizados durante sua execução.

---

### RF15 — Controlar validade dos Atestados de Saúde Ocupacional

O sistema deve controlar a validade dos Atestados de Saúde Ocupacional.

> Este requisito refere-se ao controle da validade dos Atestados de Saúde Ocupacional (Admissional, Periódico, Demissional), que identifica se um trabalhador está apto ou inapto para exercer suas funções, e alertar quando estiverem próximos do vencimento e precisam ser renovados.

---

### RF16 — Anexar mídias e testemunhas do acidente

O sistema deve permitir o anexo de mídias e testemunhas do acidente.

> Este requisito refere-se à permissão para o registro de fotos, vídeos e depoimentos de testemunhas que estavam presentes no local da ocorrência do acidente.

---

### RF17 — Gestão de descarte dos EPIs

O sistema deve permitir a gestão de descarte dos EPIs.

> Este requisito refere-se ao sistema registrar o descarte correto de equipamentos danificados ou vencidos, garantindo o registro de baixa definitiva no estoque.

---

### RF18 — Registrar investigação de acidente

O sistema deve permitir o registro de investigação de acidente.

> Este requisito refere-se ao sistema realizar o registro detalhado da investigação (ex: Metodologia da Árvore de Causas ou 5 Porquês) para identificar a causa raiz, além da simples descrição do culpado ou falha de equipamento.

---

### RF19 — Registrar incidentes (quase acidentes)

O sistema deve permitir o registro de incidentes (quase acidentes).

> Este requisito refere-se ao sistema permitir que funcionários relatem situações de risco ou incidentes que não geraram lesão, mas que poderiam ter gerado, para fins de prevenção proativa.

---

### RF20 — Gerar dashboards de segurança

O sistema deve permitir a geração de dashboards de segurança.

> Este requisito refere-se ao sistema exibir indicadores em tempo real, como taxas de frequência de acidentes, gravidade e status de conformidade de EPIs em formato de gráficos.

---

### RF21 — Emitir relatórios estatísticos

O sistema deve permitir a emissão de relatórios estatísticos.

> Este requisito refere-se ao sistema permitir a exportação de relatórios periódicos (mensais/anuais) sobre acidentes, treinamentos realizados e áreas de maior risco em formatos PDF ou CSV.

---

### RF22 — Gerar Documentação Legal (CAT)

O sistema deve permitir a Geração de Documentação Legal (CAT).

> Este requisito refere-se ao sistema permitir o preenchimento automático dos dados para a emissão da Comunicação de Acidente de Trabalho (CAT), aproveitando os dados já registrados no sistema.

---

### RF23 — Gestão de fornecedores e Certificado de Aprovação (C.A.)

O sistema deve permitir a gestão de fornecedores e C.A. (Certificado de Aprovação).

> Este requisito refere-se ao sistema registrar os fornecedores de EPI e o número do C.A. de cada equipamento, alertando caso a data de validade do certificado cadastrada internamente no equipamento esteja vencida.

---

### RF24 — Realizar simulações de cenários de risco e impacto

O sistema deve realizar simulações de cenários de risco e impacto.

> Este requisito refere-se ao sistema permitir que o gestor simule o bloqueio de áreas de risco e saídas de emergência para prever o impacto na segurança do setor e testar a eficácia das rotas de fuga alternativas.

---

### RF25 — Gerenciar ciclo de vida e substituição inteligente de EPIs

O sistema deve gerenciar o ciclo de vida e substituição inteligente de EPIs.

> Este requisito refere-se à capacidade do sistema de calcular automaticamente a data estimada de descarte de cada EPI com base na frequência de uso e condições do ambiente, gerando alertas de compra antes do esgotamento do estoque ou vencimento do CA.
