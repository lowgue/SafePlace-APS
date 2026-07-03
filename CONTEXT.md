# Dicionário de Domínio (Linguagem Ubíqua)

> **Propósito deste Documento:** Este documento centraliza a terminologia oficial do sistema SafePlace. Estes termos devem ser usados consistentemente no código-fonte, na modelagem do banco de dados e nas interfaces de usuário para evitar ambiguidades entre os desenvolvedores e os especialistas de negócio.

---

## Ocorrências e Eventos Adversos

Ocorrência
: Termo guarda-chuva para qualquer evento indesejado registrado no sistema. O fluxo de registro e gerenciamento (telas e regras básicas) é unificado para todos os tipos de ocorrência, simplificando a interface. Apenas a classificação e as exigências legais associadas mudam conforme o tipo. Uma Ocorrência pode estar associada ao EPI envolvido na falha e à Tarefa que estava sendo executada.

Acidente
: Uma *Ocorrência* que resultou em lesão física, doença ou agravo à saúde do trabalhador. Exige obrigações legais adicionais (ex: a emissão obrigatória da Comunicação de Acidente de Trabalho - CAT).

Incidente
: Uma *Ocorrência* que tinha forte potencial de causar danos, mas por sorte ou intervenção não gerou lesões físicas (comumente chamado de *quase-acidente* no setor industrial). Tratado pelo sistema com viés estritamente preventivo.

---

## Monitoramento Ambiental (Sensores)

AlertaSensor
: Registro gerado automaticamente pelo sistema quando a telemetria de um `Sensor` IoT atinge um limiar crítico (ex: concentração de gás, temperatura, vibração). **Distinto do `AlertaComportamento`**, que trata de comportamento humano. O `AlertaSensor` fica visível no painel do Gestor de Segurança e é persistido para auditoria com: data/hora, sensor de origem, leitura registrada e nível de criticidade.

---

## Treinamentos e Capacitações

Treinamento
: O catálogo ou currículo imutável de um curso obrigatório (ex: "NR-35 Trabalho em Altura"). Serve como base descritiva e para categorização das obrigações da empresa. A conclusão de um Treinamento pode gerar uma ou mais `Certificacoes` para o funcionário participante.

Turma
: O evento prático de capacitação. Possui data de início/fim, instrutor responsável e carga horária definida, sendo o momento em que o *Treinamento* é efetivamente ministrado para um grupo. **Nota:** `Turma` e `Inscricao` são entidades do domínio definidas neste dicionário mas ainda não representadas no diagrama de classes — constituem escopo de implementação futura.

Inscrição
: O vínculo transacional de um funcionário específico a uma *Turma*. Contém o registro individual e nominal de sua presença e indicação se foi aprovado ou reprovado.

---

## Ações Preventivas e Corretivas

Plano de Ação
: Um conjunto unificado de medidas e tarefas designadas para mitigar um risco. No SafePlace, os planos são genéricos e centralizados em um único painel. Podem nascer de duas fontes (Origem Polimórfica):<br><br>
**Via Ocorrência** (Reativo): Criado para evitar que o mesmo acidente volte a acontecer.<br>
**Via Inspeção** (Proativo): Criado ao se detectar uma não-conformidade no ambiente antes que um acidente ocorra.
