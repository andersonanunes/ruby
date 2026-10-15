*** Settings ***
Documentation       Valida que o JSON de enumerações do VRPAT possui a chave "typeOfEstablishment"
...                 e exibe, aleatoriamente, um dos tipos de estabelecimento.
Resource            ../resources/enumerations_service.resource
Library             String

Suite Setup         Criar Sessão Do Portal VR
Suite Teardown      Delete All Sessions


*** Test Cases ***
Exibir um tipo de estabelecimento aleatório
    [Tags]    api    typeOfEstablishment
    Given que consulto as enumerações do produto "VRPAT"
    Then o serviço deve responder com o status 200
    And o JSON retornado deve possuir a chave "typeOfEstablishment"
    And exibo aleatoriamente um dos tipos de estabelecimento


*** Keywords ***
# Keywords no estilo BDD (Given/When/Then). Embedded arguments permitem escrever os valores na frase.
# Variáveis de teste (Set Test Variable) isolam o estado de cada caso de teste.
que consulto as enumerações do produto "${produto}"
    ${response}    Consultar Enumerações Do Produto    ${produto}
    Set Test Variable    ${RESPONSE}    ${response}

o serviço deve responder com o status ${status}
    Status Should Be    ${status}    ${RESPONSE}

o JSON retornado deve possuir a chave "${chave}"
    ${body}    Set Variable    ${RESPONSE.json()}
    Dictionary Should Contain Key    ${body}    ${chave}
    # Além de existir, a chave precisa trazer uma lista com itens para que o sorteio faça sentido.
    ${tipos}    Get From Dictionary    ${body}    ${chave}
    Should Not Be Empty    ${tipos}
    Set Test Variable    ${TIPOS}    ${tipos}

exibo aleatoriamente um dos tipos de estabelecimento
    ${qtd}    Get Length    ${TIPOS}
    ${indice}    Evaluate    random.randrange(${qtd})    modules=random
    ${tipo}    Get From List    ${TIPOS}    ${indice}
    # Cada item tem o formato {"key": "REFEICAO|PIZZARIA", "name": "PIZZARIA", "label": "Refeição - Pizzaria"}.
    Dictionary Should Contain Key    ${tipo}    key
    Dictionary Should Contain Key    ${tipo}    name
    Dictionary Should Contain Key    ${tipo}    label
    ${mensagem}    Set Variable
    ...    Tipo de estabelecimento sorteado (${qtd} disponíveis): ${tipo}[label] [key: ${tipo}[key] | name: ${tipo}[name]]
    # "Log" grava no log.html; "console=True" também imprime no terminal
    Log    ${mensagem}    console=True
