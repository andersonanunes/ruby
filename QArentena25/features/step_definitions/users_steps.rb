Quando("faço uma requisição GET para o serviço Users") do
    @request_users = users.get_users
end

Entao("o serviço Users deve responder com o código http {int}") do |status_code|
    puts @request_users
    expect(@request_users.code).to eq status_code
end

Entao("retorna a lista de usuários") do
    #puts @request_users # retorna uma lista com 10 resultados
    expect(@request_users.message).not_to be_empty
end

Quando("faço uma requisição GET para o serviço Users passando um ID") do
    @id = sort_id.to_i
    @request_users = users.get_user(@id)
end
  
Entao("retorna o usuário") do
    expect(@request_users.parsed_response['id']).to eq @id
end

Quando("faço uma requisição POST para o serviço Users") do
    @payload_users = build(:user).user_hash
    @request_users = users.post_users(@payload_users)
end

Então("retorna o usuário criado") do
    expect(@request_users['id']).to eq @payload_users[:ID]
    expect(@request_users['userName']).to eq @payload_users[:Username]
    expect(@request_users['password'].to_s).to eq @payload_users[:Password]
end