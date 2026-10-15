# Carrega as dependências usadas por todos os cenários.
require 'httparty'
require 'json'
require 'rspec/expectations'

# Torna o "expect" do RSpec disponível dentro dos steps do Cucumber.
World(RSpec::Matchers)
