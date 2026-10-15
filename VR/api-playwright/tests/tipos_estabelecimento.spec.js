// @ts-check
const { test, expect } = require('@playwright/test')

// Endpoint de enumerações do portal VR: valida a chave "typeOfEstablishment"
// e exibe, aleatoriamente, um dos tipos de estabelecimento.
test.describe('Consultar tipos de estabelecimento (VRPAT)', () => {
  test('exibe um tipo de estabelecimento aleatório', async ({ request }, testInfo) => {
    const response = await test.step('Dado que consulto as enumerações do produto "VRPAT"', () =>
      request.get('enumerations/VRPAT'))

    await test.step('Então o serviço deve responder com o status 200', () => {
      expect(response.status()).toBe(200)
    })

    const tipos = await test.step('E o JSON retornado deve possuir a chave "typeOfEstablishment"', async () => {
      const body = await response.json()
      expect(body).toHaveProperty('typeOfEstablishment')
      // Além de existir, a chave precisa trazer uma lista com itens para que o sorteio faça sentido.
      expect(Array.isArray(body.typeOfEstablishment)).toBe(true)
      expect(body.typeOfEstablishment.length).toBeGreaterThan(0)
      return body.typeOfEstablishment
    })

    await test.step('E exibo aleatoriamente um dos tipos de estabelecimento', async () => {
      const tipo = tipos[Math.floor(Math.random() * tipos.length)]
      // Cada item tem o formato { key: "REFEICAO|PIZZARIA", name: "PIZZARIA", label: "Refeição - Pizzaria" }.
      expect(tipo).toEqual(
        expect.objectContaining({ key: expect.any(String), name: expect.any(String), label: expect.any(String) })
      )

      const mensagem =
        `Tipo de estabelecimento sorteado (${tipos.length} disponíveis): ` +
        `${tipo.label} [key: ${tipo.key} | name: ${tipo.name}]`
      console.log(mensagem)
      // anexa ao relatório HTML do Playwright
      await testInfo.attach('tipo-sorteado', { body: mensagem, contentType: 'text/plain' })
    })
  })
})
