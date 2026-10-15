####################################################################################################
# Name:           EnumerationsService
# Description:    Encapsula as chamadas ao endpoint de enumerações do portal VR.
#                 Os steps não conhecem URL nem HTTParty: só pedem os dados ao serviço,
#                 o que deixa os cenários legíveis e concentra a manutenção em um lugar.
# Project:        VR - Teste Prático QA
# Author:         Anderson Nunes - andersonanunes@hotmail.com
#####################################################################################################

class EnumerationsService
  include HTTParty

  base_uri 'https://portal.vr.com.br/api-web/comum'
  headers 'Accept' => 'application/json'
  # Evita que o cenário fique travado se o portal não responder.
  default_timeout 30

  # Consulta as enumerações de um produto (ex.: "VRPAT").
  # Retorna o HTTParty::Response, que expõe .code e .parsed_response (JSON já convertido em Hash).
  def self.consultar(produto)
    get("/enumerations/#{produto}")
  end
end
