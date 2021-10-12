####################################################################################################
# Name:           equipo_delete_spec.rb
# Description:    Steps para automação dos testes
# Project:        Curso QANinja180 - Projeto Rocklov API
# Author:         Anderson Nunes - andersonanunes@hotmail.com
# Date:           04/10/21
# Last Revision:  
# Revised By:     
####################################################################################################

# encoding: utf-8

describe "DELETE /equipos/{equipo_id}" do
  
  before(:all) do
    payload = {email: "to@mate.com", password: "pwd123"}
    result = Sessions.new.login(payload)
    @user_id = result.parsed_response["_id"]
  end
  
  # cenario
  context "obter unico equipo" do
    
    # steps do BDD
    before(:all) do
      
      # DADO que eu tenho um novo equipamento   
      @payload = {
        thumbnail: Helpers::get_thumb("pedais.jpg"), 
        name: "Pedais do Tom Morello", 
        category: "Áudio e Tecnologia", 
        price: 199,
      }

      # remove a massa de dados cadastrada para poder reutilizar
      MongoDB.new.remove_equipo(@payload[:name], @user_id)
      
      # E o id do equipamento
      equipo = Equipos.new.create(@payload, @user_id)
      @equipo_id = equipo.parsed_response["_id"]

      # QUANDO faço a requisição DELETE por id
      @result = Equipos.new.remove_by_id(@equipo_id, @user_id)

    end

    # validacao do teste
    it "deve retornar 204" do
      # ENTAO deve retornar status code 204
      expect(@result.code).to eql 204
    end

  end

  context "equipo nao existe" do

    before(:all) do
      @result = Equipos.new.remove_by_id(MongoDB.new.get_mongo_id, @user_id)
    end

    it "deve retornar 204" do
      expect(@result.code).to eql 204
    end

  end

end