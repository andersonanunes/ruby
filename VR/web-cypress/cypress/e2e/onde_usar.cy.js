/// <reference types="cypress" />

// Fluxo original do teste (2021): home > "Pra Você" (/onde-aceita.htm) > botão
// "Onde usar meu cartão VR" > mapa do Google em tela.
// O site foi reformulado: /onde-aceita.htm redireciona para /superapp e o mapa de
// estabelecimentos existe apenas dentro do SuperApp VR. O teste segue os mesmos passos,
// adaptados ao que o site oferece hoje.
const homePage = require('../support/pages/HomePage')
const superAppPage = require('../support/pages/SuperAppPage')

describe('Onde usar o cartão VR', () => {
  it('acessa o "Onde usar" a partir da seção Pra Você', () => {
    homePage.acessar()
    homePage.navegarParaPraVoce()
    superAppPage.validarPaginaExibida()
    superAppPage.validarMapaDeEstabelecimentos()
  })
})
