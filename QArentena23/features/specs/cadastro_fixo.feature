#language: pt
#encoding: UTF-8
#author: Anderson Nunes
#date: 28/05/21
#version: 1.0

@regressivo
Funcionalidade: Criar conta
Como um usuario do site QArentena Demo
Quero criar uma conta Demo
Para receber notícias sobre Qualidade de Software

@cadastro_valido_fixo_pf
Cenario: Cadastrar usuário pessoa física com dados válidos
Dado que acesso o cadastro de usuário
E preencho os campos do formulário com dados válidos de pessoa física
Quando confirmo o cadastro
Entao o sistema deve exibir a mensagem de boas vindas