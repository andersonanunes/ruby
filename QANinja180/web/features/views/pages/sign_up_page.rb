class SignUpPage

    include Capybara::DSL

    def open
        visit "/signup"
    end

    # recebe o objeto user do tipo hash
    def create(user)
        find("#fullName").set user[:nome]
        find("#email").set user[:email]
        find("#password").set user[:senha]
        click_button "Cadastrar"
    end

end