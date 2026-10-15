####################################################################################################
# Name:           HomePage
# Description:    Page Object da página inicial do site VR (www.vr.com.br).
# Project:        VR - Teste Prático QA
# Author:         Anderson Nunes - andersonanunes@hotmail.com
#####################################################################################################

class HomePage < SitePrism::Page
  set_url '/'

  # Logo no cabeçalho: âncora estável para confirmar que a home carregou.
  element :logo, 'header a[href="/"]'
  # Botão "Aceitar" do banner de cookies (LGPD), que pode cobrir os elementos da página.
  element :aceitar_cookies, '#onetrust-accept-btn-handler'

  # Fecha o banner de cookies, se ele aparecer. Não falha quando o banner não é exibido.
  def aceitar_cookies_se_exibido
    aceitar_cookies.click if has_aceitar_cookies?(wait: 5)
  end
end
