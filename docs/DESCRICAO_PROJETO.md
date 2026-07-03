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

Ambientes de trabalho industriais enfrentam desafios recorrentes na gestão de segurança ocupacional. Veja como o SafePlace resolve cada um deles:

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

O SafePlace adota uma **Arquitetura Híbrida** composta por três pilares complementares, garantindo modularidade, manutenibilidade e performance em tempo real:

| Pilar Arquitetural | Propósito no SafePlace |
| :--- | :--- |
| **Camadas Lógicas** | Organização macro em `Apresentação → Aplicação → Domínio → Infraestrutura` para o núcleo transacional (CRUDs). |
| **Fronteiras Hexagonais** | Isolamento do domínio de negócios em relação à infraestrutura externa (Banco de Dados, Sensores, ERP). |
| **Event-Driven (EDA)** | Processamento assíncrono de telemetria dos sensores IoT com latência máxima de 500 milissegundos. |

---

## Perfis de Acesso (RBAC)

O controle de acesso no sistema é rigidamente baseado em perfis, onde cada papel visualiza apenas o contexto pertinente:

Operador
: Registra ocorrências, consulta status dos próprios EPIs e relata incidentes preventivamente.

Gestor de Segurança
: Possui acesso completo e analítico. Gerencia estoques, investiga ocorrências, cria turmas de treinamento, conduz inspeções e opera o módulo de simulações.

Administrador
: Mantém a plataforma tecnicamente. Configura o sistema, gerencia os usuários, perfis de acesso e as integrações de hardware (sensores).

---

## Conformidade Legal

O sistema foi rigorosamente desenhado para atender às seguintes exigências legais brasileiras:

NR-1
: Disposições Gerais e Gerenciamento de Riscos Ocupacionais.

NR-6
: Equipamentos de Proteção Individual (fornecimento, registro e descarte).

NR-9
: Avaliação e Controle das Exposições Ocupacionais a Agentes Físicos, Químicos e Biológicos.

LGPD
: Lei Geral de Proteção de Dados Pessoais (Lei 13.709/2018), com criptografia AES-256 e TLS 1.3 para dados de saúde.

Legislação Previdenciária
: Parametrização para a correta emissão e exportação da CAT.
