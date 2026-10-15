const { defineConfig } = require('cypress')

module.exports = defineConfig({
  e2e: {
    baseUrl: 'https://portal.vr.com.br/api-web/comum',
    specPattern: 'cypress/e2e/**/*.cy.js',
    supportFile: false,
    responseTimeout: 30000,
    video: false,
    setupNodeEvents(on) {
      // cy.log só aparece no runner do navegador; esta task imprime no terminal do "cypress run".
      on('task', {
        print(mensagem) {
          console.log(mensagem)
          return null
        },
      })
    },
  },
})
