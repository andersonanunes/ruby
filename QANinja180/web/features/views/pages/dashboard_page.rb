class DashboardPage

    include Capybara::DSL

    # retorna true or false
    def on_dash?
        return page.has_css?(".dashboard")
    end

    def goto_dashboard
        click_button "Criar anúncio"
    end

    def equipo_list
        return find(".equipo-list")
    end

end