/// <reference types="cypress" />

// Endpoint de enumerações do portal VR: valida a chave "typeOfEstablishment"
// e exibe, aleatoriamente, um dos tipos de estabelecimento.
describe('Consultar tipos de estabelecimento (VRPAT)', () => {
  it('exibe um tipo de estabelecimento aleatório', () => {
    cy.request('/enumerations/VRPAT').then((response) => {
      expect(response.status).to.eq(200)

      // Além de existir, a chave precisa trazer uma lista com itens para que o sorteio faça sentido.
      expect(response.body).to.have.property('typeOfEstablishment')
      const tipos = response.body.typeOfEstablishment
      expect(tipos).to.be.an('array').and.not.be.empty

      const tipo = tipos[Math.floor(Math.random() * tipos.length)]
      // Cada item tem o formato { key: "REFEICAO|PIZZARIA", name: "PIZZARIA", label: "Refeição - Pizzaria" }.
      expect(tipo).to.include.all.keys('key', 'name', 'label')

      const mensagem =
        `Tipo de estabelecimento sorteado (${tipos.length} disponíveis): ` +
        `${tipo.label} [key: ${tipo.key} | name: ${tipo.name}]`
      cy.log(mensagem)
      cy.task('print', mensagem)
    })
  })
})
