describe "POST /equipos" do
  
  before(:all) do
    payload = {email: "to@mate.com", password: "pwd123"}
    result = Sessions.new.login(payload)
    @user_id = result.parsed_response["_id"]
  end
  
  context "novo equipo" do
    
    before(:all) do
      
      # carrega o payload    
      payload = {
        thumbnail: Helpers::get_thumb("kramer.jpg"), 
        name: "Kramer Van Halen", 
        category: "Cordas", 
        price: 299,
      }

      MongoDB.new.remove_equipo(payload[:name], @user_id)
      @result = Equipos.new.create(payload, @user_id)

      # valida o código de retorno
      it "deve retornar 200" do
        expect(@result.code).to eql 200
      end

    end

  end

  context "nao autorizado" do
      
    before(:all) do
      
      # carrega a imagem selecionada
      payload = {
        thumbnail: Helpers::get_thumb("baixo.jpg"), 
        name: "Contra Baixo", 
        category: "Cordas", 
        price: 50,
      }

      @result = Equipos.new.create(payload, nil)

      it "deve retornar 401" do
        expect(@result.code).to eql 401
      end

    end
    
  end

end