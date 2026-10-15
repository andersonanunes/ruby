#language: pt
#encoding: UTF-8

# Fluxo original do teste (2021): home > "Pra Você" (/onde-aceita.htm) > botão
# "Onde usar meu cartão VR" > mapa do Google em tela.
# O site foi reformulado: /onde-aceita.htm agora redireciona para /superapp e o mapa de
# estabelecimentos passou a existir apenas dentro do SuperApp VR. O cenário abaixo segue
# os mesmos passos do teste original, adaptados ao que o site oferece hoje.

@frontend @onde_usar
Funcionalidade: Onde usar o cartão VR
  Como portador do cartão VR
  Quero saber onde posso usar meu cartão
  Para encontrar estabelecimentos que aceitam VR

  Cenário: Acessar o "Onde usar" a partir da seção Pra Você
    Dado que acesso o site da VR
    Quando navego até a seção "Pra Você"
    Então sou direcionado para a página do SuperApp VR
    E vejo o mapa de estabelecimentos como funcionalidade do app
