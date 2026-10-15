####################################################################################################
# Name:           SuperAppPage
# Description:    Page Object da página do SuperApp VR (/superapp).
#                 No site atual, a antiga seção "Pra Você" (/onde-aceita.htm) redireciona para cá,
#                 e o "Onde usar meu cartão VR" (mapa de estabelecimentos) passou a ser
#                 uma funcionalidade do SuperApp, apresentada nesta página.
# Project:        VR - Teste Prático QA
# Author:         Anderson Nunes - andersonanunes@hotmail.com
#####################################################################################################

class SuperAppPage < SitePrism::Page
  set_url '/superapp'
  # Permite validar com "displayed?" que o navegador está de fato em /superapp.
  set_url_matcher %r{/superapp/?\z}

  element :titulo, 'h2', text: 'O SuperApp VR é completão'
  # Card que descreve o "Onde usar" (mapa de estabelecimentos).
  element :card_onde_usar, 'p', text: /Onde usar:\s*mapa de estabelecimentos/
  # Links para baixar o SuperApp VR (App Store / Google Play), onde o mapa está disponível.
  # Filtra pelo id do app para não confundir com outros apps citados no rodapé.
  elements :links_lojas, 'a[href*="apps.apple.com/br/app/superapp-vr"], a[href*="play.google.com"][href*="id=ws.hanzo.Vrrh"]'
end
