Dado('que faço uma requisição GET para o serviço Products') do
  @api = ProductsRequest.new
end

Quando('o serviço Products deve responder com o código http {int}') do |status_code|
  @api.get_response
  @api.get_status_code
end

Entao('retorna a lista de produtos') do
  teste = @api.get_retorna_lista
  lista = JSON.parse(teste)
  puts "Lista: #{lista["typeOfEstablishment"][5]}"
end

Entao('mostro o tipo de estabelecimento') do
  pending # Write code here that turns the phrase above into concrete actions
end