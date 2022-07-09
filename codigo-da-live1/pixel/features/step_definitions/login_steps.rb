Dado("que acesso a tela de login") do
  @screen.home.go_account
end

Quando("eu faço login com {string} e {string}") do |email, pass|
  @screen.login.with(email, pass)
end

Quando("logo sem sucesso {int} vezes") do |tentativas|
  tentativas.times do
    steps %(
        Quando eu faço login com "tony@stark.com" e "123pass"
    )
    expect(@screen.login.popup.displayed?).to be true
    back
  end
end

Quando("faço login na última tentativa") do
  steps %(
      Quando eu faço login com "tony@stark.com" e "pass123"
  )
end

Então("posso ver a tela minha conta") do
  @screen.home.go_account
  expect(@screen.my_account.view.displayed?).to be true
end

Então("devo ver {string} como popup") do |mensagem_esperada|
  expect(@screen.login.popup.text).to eql mensagem_esperada
end
