#language: pt
#encoding: UTF-8

@enumerations
Funcionalidade: Consultar tipos de estabelecimento
  Como usuário do portal VR
  Quero consultar as enumerações do produto VRPAT
  Para conhecer os tipos de estabelecimento que aceitam o cartão

  Contexto:
    Dado que consulto as enumerações do produto "VRPAT"

  @typeOfEstablishment
  Cenário: Exibir um tipo de estabelecimento aleatório
    Então o serviço deve responder com o status 200
    E o JSON retornado deve possuir a chave "typeOfEstablishment"
    E exibo aleatoriamente um dos tipos de estabelecimento
