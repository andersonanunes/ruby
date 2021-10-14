#language: pt
#encoding: UTF-8
#author: Anderson Nunes
#date: 13/10/21
#version: 1.0

@validar_informacoes
Funcionalidade: Validar informações
	Como usuário da API VR
	Quero validar os itens recebidos na requisição GET
	Para listar os dados

@get_estabelecimento
Cenario: Validar um tipo de estabelecimento aleatório
	Dado que faço uma requisição GET para o serviço VR
	Quando o serviço responder com o código http 200
	Entao mostro os dados de um tipo de estabelecimento

@get_produto
Cenario: Validar um produto
	Dado que faço uma requisição GET para o serviço VR
	Quando o serviço responder com o código http 200
	Entao mostro os dados de um tipo de produto

@get_dominios
Cenario: Validar o domínio
	Dado que faço uma requisição GET para o serviço VR
	Quando o serviço responder com o código http 200
	Entao mostro os dados de um tipo de domínio

Esquema do Cenario: Validar um item da lista
	Dado que faço uma requisição GET para o serviço VR
	Quando o serviço responder com o código http <status_code>
	Entao mostro os dados de um item da lista "<item_lista>"

	Exemplos:
	| status_code | item_lista          |
	| 200         | products            |
	| 200         | operatingDays       |
	| 200         | typeOfEstablishment |
	| 200         | videos              |