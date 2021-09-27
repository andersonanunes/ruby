#language: pt
#encoding: UTF-8
#author: Anderson Nunes
#date: 31/05/21
#version: 1.0

@users
Funcionalidade: Users
    Validar operações da API users

    @get_users
    Cenario: Validar GET API users
        Quando faço uma requisição GET para o serviço Users
        Entao o serviço Users deve responder com o código http 200
        E retorna a lista de usuários

    @get_users
    Cenario: Validar GET API users com ID
        Quando faço uma requisição GET para o serviço Users passando um ID
        Entao o serviço Users deve responder com o código http 200
        E retorna o usuário

    @post_users
    Cenario: Validar POST API Users
        Quando faço uma requisição POST para o serviço Users
        Entao o serviço Users deve responder com o código http 200
        E retorna o usuário criado