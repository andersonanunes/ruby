// Page Object da página inicial (www.vr.com.br)
class HomePage {
  elements = {
    // logo no cabeçalho: âncora estável para confirmar que a home carregou
    logo: () => cy.get('header a[href="/"]').first(),
  }

  acessar() {
    cy.visit('/')
    this.elements.logo().should('be.visible')
    this.aceitarCookiesSeExibido()
  }

  // Fecha o banner de cookies (LGPD) se ele existir; não falha quando não é exibido.
  aceitarCookiesSeExibido() {
    cy.get('body').then(($body) => {
      const botao = $body.find('#onetrust-accept-btn-handler:visible')
      if (botao.length) cy.wrap(botao).click()
    })
  }

  // A seção "Pra Você" saiu do menu; o enunciado indica o endereço /onde-aceita.htm,
  // que é usado para validar o redirecionamento do link legado.
  navegarParaPraVoce() {
    cy.visit('/onde-aceita.htm')
  }
}

module.exports = new HomePage()
