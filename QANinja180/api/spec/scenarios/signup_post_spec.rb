describe "POST/signup" do
	
	# cenario 1
	context "novo usuario" do
		
		before(:all) do
			
			payload = {
				name: "Pitty", 
				email: "pitty@bol.com.br", 
				password: "pwd123"
			}

			MongoDB.new.remove_user(payload[:email])
			@result = Signup.new.create(payload)
		
		end


		it "valida status code" do
      expect(@result.code).to eql 200
    end

    it "valida id do usuário" do
      expect(@result.parsed_response["_id"].length).to eql 24
    end

	end

	# cenario 2
	context "usuario ja existe" do
		
		before(:all) do
			
			# dado que eu tenho um novo ususario
			payload = {
				name: "João da Silva", 
				email: "joao@ig.com.br", 
				password: "pwd123"
			}
			MongoDB.new.remove_user(payload[:email])
			
			# e o email ja esta cadastrado
			Signup.new.create(payload)
			
			# quando faço uma requisicao para a rota signup
			@result = Signup.new.create(payload)
		
		end

		it "deve retornar 409" do
			# entao retona status code 409
			expect(@result.code).to eql 409
		end

		it "deve retornar a mensagem" do
			# e vejo a mensagem
			expect(@result.parsed_response["error"]).to eql "Email already exists :("
		end

	end

	context "validar campos obrigatorios" do
		
	end
	
end