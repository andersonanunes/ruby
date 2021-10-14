####################################################################################################
# Name:           ProductsSteps
# Description:    Steps do BDD
# Project:        VR - Projeto Teste
# Author:         Anderson Nunes - andersonanunes@hotmail.com
# Date:           13/10/21
# Last Revision:  
# Revised By:     
#####################################################################################################

Dado('que faço uma requisição GET para o serviço VR') do
  @api = ProductsRequest.new
end

Quando('o serviço responder com o código http {int}') do |status_code|
  @api.get_response
  expect(@api.get_status_code).to eql status_code
  expect(@api.get_message).to eql ('OK')
end

Entao('mostro os dados de um tipo de estabelecimento') do
  @api.get_retorna_lista
  puts "Item da lista : #{$lista["typeOfEstablishment"][rand($lista["typeOfEstablishment"].size)]}"
end

Entao('mostro os dados de um tipo de produto') do
  @api.get_retorna_lista
  puts "Item da lista : #{$lista["products"][rand($lista["products"].size)]}"
end

Entao('mostro os dados de um tipo de domínio') do
  @api.get_retorna_lista
  puts "Item da lista : #{$lista["dominios"]["TIPO_LOGRADOURO"][rand($lista["dominios"]["TIPO_LOGRADOURO"].size)]}\n"
end

Entao('mostro os dados de um item da lista {string}') do |item_lista|
  @api.get_retorna_lista_por_tipo
  puts "Item da lista : #{$lista_por_tipo["#{item_lista}"][rand($lista_por_tipo["#{item_lista}"].size)]}\n"
end