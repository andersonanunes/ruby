describe "GET /equipos/{equipo_id}" do
  
  before(:all) do
    payload = {email: "to@mate.com", password: "pwd123"}
    result = Sessions.new.login(payload)
    @user_id = result.parsed_response["_id"]
  end
  
  context "obter unico equipo" do
    
    before(:all) do
      
      # carrega o payload   
      @payload = {
        thumbnail: Helpers::get_thumb("kramer.jpg"), 
        name: "Sanfona", 
        category: "Outros", 
        price: 499,
      }

      MongoDB.new.remove_equipo(@payload[:name], @user_id)
      
      # eu tenho o id do equipamento
      equipo = Equipos.new.create(@payload, @user_id)
      @equipo_id = equipo.parsed_response["_id"]

      # faz a requisição get por id
      @result = Equipos.new.find_by_id(@equipo_id, @user_id)
    end

    it "deve retornar 200" do
      expect(@result.code).to eql 200
    end

    it "deve retornar o nome" do
      expect(@result.parsed_response).to include("name" => @payload[:name])
    end

  end
  
end