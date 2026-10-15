// @ts-check
const { defineConfig } = require('@playwright/test')

// Teste só de API: usa a fixture "request", então nenhum navegador é aberto (nem precisa ser instalado).
module.exports = defineConfig({
  testDir: './tests',
  timeout: 30_000,
  reporter: [['list'], ['html', { open: 'never' }]],
  use: {
    // a barra final é necessária para que caminhos relativos sejam anexados a "/comum/"
    baseURL: 'https://portal.vr.com.br/api-web/comum/',
    extraHTTPHeaders: { Accept: 'application/json' },
  },
})
