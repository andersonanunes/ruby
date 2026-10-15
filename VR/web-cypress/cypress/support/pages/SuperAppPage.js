// Page Object da página do SuperApp VR (/superapp).
// No site atual, /onde-aceita.htm redireciona para cá e o "Onde usar" (mapa de
// estabelecimentos) passou a ser uma funcionalidade do app apresentada nesta página.
class SuperAppPage {
  elements = {
    titulo: () => cy.contains('h2', 'O SuperApp VR é completão'),
    cardOndeUsar: () => cy.contains('p', /Onde usar:\s*mapa de estabelecimentos/),
    // filtra pelo id do app para não pegar outros apps citados no rodapé
    linksLojas: () =>
      cy.get('a[href*="apps.apple.com/br/app/superapp-vr"], a[href*="play.google.com"][href*="id=ws.hanzo.Vrrh"]'),
  }

  validarPaginaExibida() {
    cy.location('pathname').should('match', /^\/superapp\/?$/)
    this.elements.titulo().should('be.visible')
  }

  validarMapaDeEstabelecimentos() {
    this.elements.cardOndeUsar().scrollIntoView().should('be.visible')
    // sem os links das lojas o usuário não chega ao mapa, então eles também são validados
    this.elements.linksLojas().should('have.length.greaterThan', 0)
  }
}

module.exports = new SuperAppPage()
