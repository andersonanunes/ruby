require 'factory_bot'
require 'faker'
require 'httparty'
require 'rspec'

# inclui o modulo specs_rest
require_relative 'specs_helper/specs_rest'

# verifica qual ambiente está sendo carregado
CONFIG = YAML.load_file(File.dirname(__FILE__) + "/config/#{ENV['AMBIENTE']}.yml")

# torna os metodos publicos
World(REST, FactoryBot::Syntax::Methods)