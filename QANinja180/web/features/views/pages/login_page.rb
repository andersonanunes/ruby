class LoginPage
    include Capybara::DSL

    def open
        visit "/"
    end

    # padrao app action responsabilidades dentro de cada objeto
    def with(email, password)
        find("input[placeholder='Seu email']").set email
        find("input[type=password]").set password
        click_button "Entrar"
    end

end