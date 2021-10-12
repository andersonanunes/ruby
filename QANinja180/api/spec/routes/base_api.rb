####################################################################################################
# Name:           BaseApi
# Description:    Classe que implementa o endpoint da aplicação
# Project:        Curso QANinja180 - Projeto Rocklov API
# Author:         Anderson Nunes - andersonanunes@hotmail.com
# Date:           04/10/21
# Last Revision:  
# Revised By:     
#####################################################################################################

require "httparty"

class BaseApi
  
  include HTTParty
  base_uri "http://rocklov-api:3333"

end