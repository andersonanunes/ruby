const { expect } = require('@playwright/test')

// Page Object da página do SuperApp VR (/superapp).
// No site atual, /onde-aceita.htm redireciona para cá e o "Onde usar" (mapa de
// estabelecimentos) passou a ser uma funcionalidade do app apresentada nesta página.
class SuperAppPage {
  /** @param {import('@playwright/test').Page} page */
  constructor(page) {
    this.page = page
    this.titulo = page.getByRole('heading', { level: 2, name: 'O SuperApp VR é completão' })
    this.cardOndeUsar = page.locator('p', { hasText: /Onde usar:\s*mapa de estabelecimentos/ })
    // filtra pelo id do app para não pegar outros apps citados no rodapé
    this.linksLojas = page.locator(
      'a[href*="apps.apple.com/br/app/superapp-vr"], a[href*="play.google.com"][href*="id=ws.hanzo.Vrrh"]'
    )
  }

  async validarPaginaExibida() {
    await expect(this.page).toHaveURL(/\/superapp\/?$/)
    await expect(this.titulo).toBeVisible()
  }

  async validarMapaDeEstabelecimentos() {
    await this.cardOndeUsar.scrollIntoViewIfNeeded()
    await expect(this.cardOndeUsar).toBeVisible()
    // sem os links das lojas o usuário não chega ao mapa, então eles também são validados
    expect(await this.linksLojas.count()).toBeGreaterThan(0)
  }
}

module.exports = { SuperAppPage }
