####################################################################################################
# Name:           ProductsRequest
# Description:    Métodos que realizam as chamadas na aplicação
# Project:        VR - Projeto Teste
# Author:         Anderson Nunes - andersonanunes@hotmail.com
# Date:           13/10/21
# Last Revision:  
# Revised By:     
#####################################################################################################

class ProductsRequest

  # metodo que realiza as requisições GET nas chamadas
  def get_response
    require 'httparty'
    @response = HTTParty.get('https://portal.vr.com.br/api-web/comum/enumerations/VRPAT')
  end

  # metodo que retorna o status code
  def get_status_code
    status_code = @response.code
  end

  # metodo que retorna o status da mensagem
  def get_message
    message = @response.message
  end

  # metodo que retorna itens da lista
  def get_retorna_lista
    body = @response.body
    $lista = JSON.parse(body)
  end

  # metodo que retorna itens da lista
  def get_retorna_lista_por_tipo
    body = @response.body
    $lista_por_tipo = JSON.parse(body)
  end

end