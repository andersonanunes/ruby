class ProductsRequest

  # metodo que realiza as requisições GET nas chamadas
  def get_response

    require 'httparty'

    @response = HTTParty.get('https://portal.vr.com.br/api-web/comum/enumerations/VRPAT')

    # puts response.body if response.code == 200
    # puts "response code: #{response.code}"
    # puts "response message: #{response.message}"
    # puts "response headers: #{response.headers}"
    # puts "response body: #{response.body}"
    #@@result = "\n Request: #{cenario}\nResponse: #{@response}\n".force_encoding('UTF-8')
  end

  # metodo que verifica o status code
  def get_status_code
    status_code = @response.code
    return status_code
  end

  def get_retorna_lista
    body = @response.body
    return body
  end

end