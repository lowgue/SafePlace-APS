# ADR 0001: Validação Manual da Data de Validade do CA (EPI)

**Data**: 2026-07-02
**Status**: Aceito

## Contexto
O sistema precisa garantir que os Equipamentos de Proteção Individual (EPIs) em estoque e em uso possuam um Certificado de Aprovação (CA) válido no Ministério do Trabalho. Havia a possibilidade de integrar o sistema com o portal do governo (via web scraping ou API não documentada) para validar se o CA estava ativo em tempo real no momento do cadastro do EPI.

## Decisão
Decidimos **não realizar a integração automatizada** com a base de dados do Ministério do Trabalho. Em vez disso, a responsabilidade de verificar a validade no portal do governo e inserir a **Data de Validade do CA** no sistema será inteiramente manual e de responsabilidade do **Gestor de Segurança**. O sistema apenas bloqueará o cadastro e uso do EPI caso a data inserida internamente no SafePlace já esteja expirada.

## Justificativa (Trade-off)
Não existe uma API pública estável oficial do governo para validação de CA. Depender de rotinas de *web scraping* geraria alta instabilidade, quebrando o fluxo de cadastro do usuário toda vez que o portal do governo ficasse fora do ar ou mudasse seu layout HTML. A abordagem manual troca a automação (que é frágil) pela estabilidade e disponibilidade do nosso sistema, criando uma trilha de auditoria baseada na ação do Gestor.

## Consequências
- **Positivas**: Sistema altamente estável, sem dependência de serviços externos frágeis; desenvolvimento mais rápido; sistema não ficará bloqueado se o site do governo cair.
- **Negativas**: O Gestor pode cometer um erro de digitação ao inserir a data de validade, ou um CA que era válido ser suspenso posteriormente pelo governo (já que o sistema não fará revalidações ativas constantes).
