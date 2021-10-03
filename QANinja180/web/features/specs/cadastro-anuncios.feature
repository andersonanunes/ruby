#language: pt

Funcionalidade: Cadastro de Anúncios
  Sendo usuário cadastrado no Rocklov que possui equipamentos musicais
  Quero cadastrar meus equipamentos
  Para que eu possa disponibilizados para locação

  Contexto: Login
    * Login com "betao@yahoo.com" e "pwd123"

  Cenario: Novo equipo
    Dado que acesso o formulario de cadastro de anúncios
    E que eu tenho o seguinte equipamento:
      | thumb     | fender-sb.jpg |
      | nome      | Fender Strato |
      | categoria | Cordas        |
      | preco     | 200           |
    Quando submeto o cadastro desse item
    Então devo ver esse item no meu Dashboard

  Cenario: Anúncio sem foto
    Dado que acesso o formulario de cadastro de anúncios
    E que eu tenho o seguinte equipamento:
      | thumb     |               |
      | nome      | Fender Strato |
      | categoria | Cordas        |
      | preco     | 200           |
    Quando submeto o cadastro desse item
    Então deve conter a mensagem de alerta: "Adicione uma foto no seu anúncio!"

  Esquema do Cenario: Tentativa de cadastro de anúncios
    Dado que acesso o formulario de cadastro de anúncios
    E que eu tenho o seguinte equipamento:
      | thumb     | <foto>      |
      | nome      | <nome>      |
      | categoria | <categoria> |
      | preco     | <preco>     |
    Quando submeto o cadastro desse item
    Então deve conter a mensagem de alerta: "<saida>"

    Exemplos:
      | foto          | nome              | categoria | preco | saida                             |
      |               | Violão de Nylon   | Cordas    | 150   | Adicione uma foto no seu anúncio! |
      | clarinete.jpg |                   | Outros    | 250   | Informe a descrição do anúncio!   |
      | mic.jpg       | Microfone Shure   |           | 100   | Informe a categoria               |
      | trompete.jpg  | Trompete Clássico | Outros    |       | Informe o valor da diária         |

