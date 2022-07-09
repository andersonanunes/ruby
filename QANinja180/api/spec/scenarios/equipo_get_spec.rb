####################################################################################################
# Name:           equipo_get_spec.rb
# Description:    Steps para automação dos testes
# Project:        Curso QANinja180 - Projeto Rocklov API
# Author:         Anderson Nunes - andersonanunes@hotmail.com
# Date:           04/10/21
# Last Revision:  
# Revised By:     
####################################################################################################

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
        thumbnail: Helpers::get_thumb("sanfona.jpg"), 
        name: "Sanfona", 
        category: "Outros", 
        price: 499,
      }

      # remove a massa de dados cadastrada para poder reutilizar
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

  context "equipo nao existe" do

    before(:all) do
      @result = Equipos.new.find_by_id(MongoDB.new.get_mongo_id, @user_id)
    end

    it "deve retornar 404" do
      expect(@result.code).to eql 404
    end

  end

end

describe "GET /equipos" do
  
  # faz o login na api
  before(:all) do
    payload = {email: "penelope@gmail.com", password: "pwd123"}
    result = Sessions.new.login(payload)
    @user_id = result.parsed_response["_id"]
  end

  context "obter uma lista" do
    # Dado que tenho uma lista de Equipos
    before(:all) do
      # carrega o payload   
      payloads = [
        {
        thumbnail: Helpers::get_thumb("sanfona.jpg"), 
        name: "Sanfona", 
        category: "Outros", 
        price: 499,
        },
        {
          thumbnail: Helpers::get_thumb("trompete.jpg"), 
          name: "Trompete", 
          category: "Outros", 
          price: 599,
        },
        {
          thumbnail: Helpers::get_thumb("slash.jpg"), 
          name: "Les Paul", 
          category: "Outros", 
          price: 699,
        }]

        payloads.each |payload|
          MongoDB.new.remove_equipo(payload[:name], @user_id)
          Equipos.new.create(payload, @user_id)
        end

        # Quando faço um GET para /equipos
        @result = Equipos.new.list(@user_id)

    end

    #Entao deve retornar o status code 200
    it "deve retornar 200" do
      expect(@result.code).to eql 200
    end

    it "deve retornar uma lista de equipos" do
      expect(@result.parsed_response).not_to be_empty
    end

  end

