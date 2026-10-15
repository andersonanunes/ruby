// Scripts de terceiros do site (analytics, tag manager etc.) podem lançar erros de JavaScript
// que não têm relação com o fluxo testado. Sem este handler o Cypress falharia o teste por eles.
Cypress.on('uncaught:exception', () => false)
