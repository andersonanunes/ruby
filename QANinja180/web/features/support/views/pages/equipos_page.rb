class EquiposPage
    
    include Capybara::DSL
    
    def create_equipo(equipo)
        #checkpoint com timeout explicito, fica esperando carregar a página pra verificar o elemento
        page.has_css?("#equipoForm")

        # verifica se possui foto
        upload(equipo[:thumb]) if equipo[:thumb].length > 0

        find("input[placeholder$=equipamento]").set equipo[:nome]

        # verifica se o campo categoria esta vazio
        select_cat(equipo[:categoria]) if equipo[:categoria].length > 0

        find("input[placeholder^=Valor]").set equipo[:preco]
    
        click_button "Cadastrar"
    end

    # recebe a imagem
    def upload(filename)
        thumb = Dir.pwd + "/features/support/fixtures/images/" + equipo[:thumb]
        find("#thumbnail input[type=file]", visible: false).set thumb
    end

    def categoria(cat)
        find("#category").find('option', text: cat).select_option
    end

end