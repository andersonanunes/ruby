####################################################################################################
# Name:           EnumerationsSteps
# Description:    Steps do cenário de consulta dos tipos de estabelecimento (VRPAT).
# Project:        VR - Teste Prático QA
# Author:         Anderson Nunes - andersonanunes@hotmail.com
#####################################################################################################

Dado('que consulto as enumerações do produto {string}') do |produto|
  # A resposta fica em variável de instância: o Cucumber cria um "World" novo por cenário,
  # então não há vazamento de estado entre cenários (ao contrário de variáveis globais).
  @response = EnumerationsService.consultar(produto)
end

Então('o serviço deve responder com o status {int}') do |status|
  expect(@response.code).to eq(status)
end

Então('o JSON retornado deve possuir a chave {string}') do |chave|
  @body = @response.parsed_response

  # Garante que o corpo é de fato um JSON (Hash) antes de procurar a chave.
  expect(@body).to be_a(Hash)
  expect(@body).to have_key(chave)

  # Além de existir, a chave precisa trazer uma lista com itens para que o sorteio faça sentido.
  @tipos = @body[chave]
  expect(@tipos).to be_an(Array)
  expect(@tipos).not_to be_empty
end

Então('exibo aleatoriamente um dos tipos de estabelecimento') do
  # Array#sample sorteia um elemento aleatório da lista.
  tipo = @tipos.sample

  # Cada item tem o formato { "key" => "REFEICAO|PIZZARIA", "name" => "PIZZARIA", "label" => "Refeição - Pizzaria" }.
  expect(tipo).to include('key', 'name', 'label')

  # "log" imprime no console (formatter pretty) e também anexa a mensagem ao relatório HTML.
  log("Tipo de estabelecimento sorteado (#{@tipos.size} disponíveis): " \
      "#{tipo['label']} [key: #{tipo['key']} | name: #{tipo['name']}]")
end
