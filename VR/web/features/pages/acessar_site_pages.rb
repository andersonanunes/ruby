class AcessarSite
  
  include Capybara::DSL

  def abrir_site
    visit "/"
  end
  
end