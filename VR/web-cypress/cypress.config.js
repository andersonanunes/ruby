const { defineConfig } = require('cypress')

module.exports = defineConfig({
  e2e: {
    baseUrl: 'https://www.vr.com.br',
    specPattern: 'cypress/e2e/**/*.cy.js',
    supportFile: 'cypress/support/e2e.js',
    // viewport desktop, igual aos demais projetos de frontend
    viewportWidth: 1366,
    viewportHeight: 768,
    // site externo: dá mais folga para carregamento de página e elementos
    defaultCommandTimeout: 15000,
    pageLoadTimeout: 60000,
    video: false,
    screenshotOnRunFailure: true,
  },
})
