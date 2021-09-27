class UsersModel
    attr_accessor :id, :userName, :password

    # estrutura do payload
    def user_hash
        {
            ID: @id,
            Username: @userName,
            Password: @password
        }
    end
end