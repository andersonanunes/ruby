// @ts-check
const { test } = require('@playwright/test')
const { HomePage } = require('../pages/HomePage')
const { SuperAppPage } = require('../pages/SuperAppPage')

// Fluxo original do teste (2021): home > "Pra Você" (/onde-aceita.htm) > botão
// "Onde usar meu cartão VR" > mapa do Google em tela.
// O site foi reformulado: /onde-aceita.htm redireciona para /superapp e o mapa de
// estabelecimentos existe apenas dentro do SuperApp VR. O teste segue os mesmos passos,
// adaptados ao que o site oferece hoje.
test.describe('Onde usar o cartão VR', () => {
  test('acessa o "Onde usar" a partir da seção Pra Você', async ({ page }) => {
    const homePage = new HomePage(page)
    const superAppPage = new SuperAppPage(page)

    await test.step('Dado que acesso o site da VR', () => homePage.acessar())
    await test.step('Quando navego até a seção "Pra Você"', () => homePage.navegarParaPraVoce())
    await test.step('Então sou direcionado para a página do SuperApp VR', () =>
      superAppPage.validarPaginaExibida())
    await test.step('E vejo o mapa de estabelecimentos como funcionalidade do app', () =>
      superAppPage.validarMapaDeEstabelecimentos())
  })
})
