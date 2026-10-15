// @ts-check
const { defineConfig } = require('@playwright/test')

module.exports = defineConfig({
  testDir: './tests',
  timeout: 60_000,
  expect: { timeout: 15_000 },
  // site externo: uma nova tentativa ajuda a separar instabilidade de rede de falha real
  retries: 1,
  reporter: [['list'], ['html', { open: 'never' }]],
  use: {
    baseURL: 'https://www.vr.com.br',
    // usa o Google Chrome instalado na máquina (dispensa baixar o Chromium do Playwright)
    channel: 'chrome',
    viewport: { width: 1366, height: 768 },
    locale: 'pt-BR',
    screenshot: 'only-on-failure',
    trace: 'retain-on-failure',
  },
})
