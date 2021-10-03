describe "POST /equipos" do
  
  before(:all) do
    payload = {email: "annunes@gmail.com", password: "pwd123"}
    result = Sessions.new.login(payload)
    @user_id = result.parsed_response["_id"]
  end
  
  context "novo equipo" do
    before(:all) do
      
      # carrega a imagem selecionada
      thumbnail = File.open(File.join(Dir.pwd, "spec/fixtures/images", "kramer.jpg"))
      
      payload = {thumbnail: thumbnail, name: "Kramer Van Halen", category: "Cordas", price: 299}
      @result = Equipos.new.create(payload, @user_id)
    end

    it "deve retornar 200" do
      expect(@result.code).to eql 200
    end
    
  end
end