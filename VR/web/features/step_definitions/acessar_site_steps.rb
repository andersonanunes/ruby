Dado('que acesso a aplicação') do
  @abrir.abrir_site
end

Quando('seleciono a página onde aceita') do
  @abrir.visitar_pagina
end

Então('valido se o mapa do Google aparece na tela') do
  pending # Write code here that turns the phrase above into concrete actions
end