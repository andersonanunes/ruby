module REST
    class Users
        include HTTParty

        headers 'Content-Type' => 'application/json'
        base_uri CONFIG['base_uri']

        # recebe uma lista de usuarios
        def get_users
            self.class.get('/api/v1/Users/')
        end

        # recebe o ID pelo GET
        def get_user(id)
            self.class.get("/api/v1/Users/#{id}")
        end

        # cria o metodo post para enviar a requisicao
        def post_users(user)
            self.class.post('/api/v1/Users/', body: user.to_json)
        end
    end
end