####################################################################################################
# Name:           Equipos
# Description:    Classe que recebe o payload
# Project:        Curso QANinja180 - Projeto Rocklov API
# Author:         Anderson Nunes - andersonanunes@hotmail.com
# Date:           04/10/21
# Last Revision:  
# Revised By:     
#####################################################################################################

require_relative "base_api"

class Equipos < BaseApi
	
	# cria um novo equipamento
	def create(payload, user_id)
		return self.class.post(
			"/equipos",
			body: payload,
			headers: { 
				"user_id": user_id, 
			},
		)		
	end

	# procura equipo por id
	def find_by_id(equipo_id, user_id)
		return self.class.get(
			"/equipos/#{equipo_id}",
			headers: { 
				"user_id": user_id, 
			},
		)
	end

	# remove equipo por id
	def remove_by_id(equipo_id, user_id)
		return self.class.delete(
			"/equipos/#{equipo_id}",
			headers: { 
				"user_id": user_id, 
			},
		)
	end	
end