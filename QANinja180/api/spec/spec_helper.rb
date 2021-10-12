####################################################################################################
# Name:           spec_helpr.rb
# Description:    Arquivo de configuração do RSPEC
# Project:        Curso QANinja180 - Projeto Rocklov API
# Author:         Anderson Nunes - andersonanunes@hotmail.com
# Date:           04/10/21
# Last Revision:  
# Revised By:     
####################################################################################################

require_relative "routes/equipos"
require_relative "routes/sessions"
require_relative "routes/signup"
require_relative "libs/mongo"
require_relative "helpers"

require 'httparty'
require 'httparty/request'
require 'httparty/response/headers'

RSpec.configure do |config|

  include Helpers

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
