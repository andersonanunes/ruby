####################################################################################################
# Name:           BaseApi
# Description:    Classe que implementa o endpoint da aplicação
# Project:        VR - Projeto Teste
# Author:         Anderson Nunes - andersonanunes@hotmail.com
# Date:           13/10/21
# Last Revision:  
# Revised By:     
#####################################################################################################

require "httparty"

class BaseApi

  include HTTParty
  base_uri "https://portal.vr.com.br/api-web/comum/enumerations/VRPAT"

end