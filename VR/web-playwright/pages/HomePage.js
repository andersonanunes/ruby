const { expect } = require('@playwright/test')

// Page Object da página inicial (www.vr.com.br)
class HomePage {
  /** @param {import('@playwright/test').Page} page */
  constructor(page) {
    this.page = page
    // logo no cabeçalho: âncora estável para confirmar que a home carregou
    this.logo = page.locator('header a[href="/"]').first()
    this.botaoAceitarCookies = page.locator('#onetrust-accept-btn-handler')
  }

  async acessar() {
    await this.page.goto('/')
    await expect(this.logo).toBeVisible()
    await this.aceitarCookiesSeExibido()
  }

  // Fecha o banner de cookies (LGPD) se ele aparecer; não falha quando não é exibido.
  async aceitarCookiesSeExibido() {
    if (await this.botaoAceitarCookies.isVisible()) {
      await this.botaoAceitarCookies.click()
    }
  }

  // A seção "Pra Você" saiu do menu; o enunciado indica o endereço /onde-aceita.htm,
  // que é usado para validar o redirecionamento do link legado.
  async navegarParaPraVoce() {
    await this.page.goto('/onde-aceita.htm')
  }
}

module.exports = { HomePage }
