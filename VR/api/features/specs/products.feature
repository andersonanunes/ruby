#language: pt
#encoding: UTF-8
#author: Anderson Nunes
#date: 13/10/21
#version: 1.0

@products
Funcionalidade: Products
	Validar estabelecimentos da API VR

	@get_products
	Cenario: Validar GET API Products
		Dado que faço uma requisição GET para o serviço Products
		Quando o serviço Products deve responder com o código http 200
		Entao retorna a lista de produtos
		E mostro o tipo de estabelecimento