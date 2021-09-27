require 'capybara'
require 'cucumber'
require 'rspec'
require 'selenium-webdriver'
require 'site_prism'
require 'cpf_faker'
require 'faker'

# associar o site_prism ao driver
Capybara.register_driver :site_prism do |app|
    Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.configure do |config|
    config.run_server = false
    Capybara.default_driver = :site_prism
    Capybara.page.driver.browser.manage.window.maximize
    config.default_max_wait_time = 10
    config.app_host = 'http://www.lourencodemonaco.com.br/qarentena'
    
end