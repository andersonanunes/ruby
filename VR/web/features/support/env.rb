require 'capybara'
require 'capybara/cucumber'
require 'pry'

# configuracao multiambiente
CONFIG = YAML.load_file(File.join(Dir.pwd, "/features/support/config/hml.yml"))

# configuracao cucumber
CUCUMBER_PUBLISH_ENABLED=true

# configuracao cross browser
case ENV["BROWSER"]
  when "chrome"
    @driver = :selenium_chrome
  when "firefox"
    @driver = :selenium
  else
    # estoura o erro e nem executa nada
    raise "Browser Inválido :("
end

Capybara.configure do |config|
  config.default_driver = @driver
  config.app_host = CONFIG["base_dir"]
  config.default_max_wait_time = 10
  Capybara.page.driver.browser.manage.window.maximize
  #Capybara.page.current_window.resize_to(1440, 900)
end
