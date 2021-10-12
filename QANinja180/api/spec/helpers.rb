####################################################################################################
# Name:           Helpers
# Description:    Módulo Helpers - configurações adicionais
# Project:        Curso QANinja180 - Projeto Rocklov API
# Author:         Anderson Nunes - andersonanunes@hotmail.com
# Date:           04/10/21
# Last Revision:  
# Revised By:     
####################################################################################################

require 'httparty'
require 'httparty/request'
require 'httparty/response/headers'

module Helpers
  
  include HTTParty
  
  def get_fixture(item)
    YAML.load(File.read(Dir.pwd + "/spec/fixtures/#{item}.yml"), symbolize_names: true)
  end

  def get_thumb(file_name)
    return File.open(File.join(Dir.pwd, "spec/fixtures/images/", file_name), "rb")
  end

  module_function :get_fixture
  module_function :get_thumb
  
end
