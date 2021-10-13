class OndeAceita

  include Capybara::DSL

  def visitar_pagina
    visit "/onde-aceita"
  end

end