####################################################################################################
# Name:           OndeUsarSteps
# Description:    Steps do cenário "Onde usar o cartão VR".
# Project:        VR - Teste Prático QA
# Author:         Anderson Nunes - andersonanunes@hotmail.com
#####################################################################################################

Dado('que acesso o site da VR') do
  @home = HomePage.new
  @home.load
  @home.aceitar_cookies_se_exibido
  expect(@home).to have_logo
end

Quando('navego até a seção {string}') do |_secao|
  # A seção "Pra Você" não está mais no menu; o teste usa o endereço indicado
  # no enunciado (/onde-aceita.htm) para validar o redirecionamento do link legado.
  visit '/onde-aceita.htm'
end

Então('sou direcionado para a página do SuperApp VR') do
  @superapp = SuperAppPage.new
  # "displayed?" aguarda (até default_max_wait_time) a URL bater com o set_url_matcher.
  expect(@superapp).to be_displayed
  expect(@superapp).to have_titulo
end

Então('vejo o mapa de estabelecimentos como funcionalidade do app') do
  expect(@superapp).to have_card_onde_usar
  @superapp.card_onde_usar.scroll_to(:center)
  expect(@superapp.card_onde_usar).to be_visible

  # Sem os links das lojas o usuário não conseguiria chegar ao mapa, então eles também são validados.
  expect(@superapp).to have_links_lojas
  log("Lojas disponíveis: #{@superapp.links_lojas.map { |link| link[:href] }.uniq.join(', ')}")
end
