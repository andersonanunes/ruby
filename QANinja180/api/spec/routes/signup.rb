####################################################################################################
# Name:           Signup
# Description:    Classe que recebe o payload
# Project:        Curso QANinja180 - Projeto Rocklov API
# Author:         Anderson Nunes - andersonanunes@hotmail.com
# Date:           04/10/21
# Last Revision:  
# Revised By:     
#####################################################################################################

require_relative "base_api"

class Signup < BaseApi
	
	def create(payload)
		
		return self.class.post(
			"/signup",
			body: payload.to_json,
			headers: {
				"Content-Type": "application-json",
			},
		)

	end

end