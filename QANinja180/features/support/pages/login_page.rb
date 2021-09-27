

class LoginPage
    include Capybara::DSL

    def abrir
        visit "/"
    end

    def campo_email
        return find("input[placeholder='Seu email']")
    end

    def campo_senha
        return find("input[type=password]")
    end

    def botao_entrar
        click_button "Entrar"
    end

end