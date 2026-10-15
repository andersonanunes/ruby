require 'capybara/cucumber'
require 'selenium-webdriver'
require 'webdrivers/chromedriver'
require 'site_prism'
require 'rspec/expectations'

World(RSpec::Matchers)

# Driver do Chrome. Roda headless por padrão (ideal para CI);
# use HEADLESS=false (ou o perfil "visual") para acompanhar a execução no navegador.
Capybara.register_driver :chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--headless=new') unless ENV['HEADLESS'] == 'false'
  options.add_argument('--window-size=1366,768') # viewport desktop
  options.add_argument('--disable-gpu')
  options.add_argument('--lang=pt-BR')

  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.configure do |config|
  config.default_driver = :chrome
  config.app_host = 'https://www.vr.com.br'
  # Tempo máximo que o Capybara aguarda um elemento/condição antes de falhar.
  config.default_max_wait_time = 15
  # O site não é uma aplicação local, então o Capybara não deve subir servidor.
  config.run_server = false
end
