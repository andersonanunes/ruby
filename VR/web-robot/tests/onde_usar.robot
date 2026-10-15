*** Settings ***
Resource            ../resources/pages/home_page.resource
Resource            ../resources/pages/superapp_page.resource

Suite Setup         Abrir Navegador
Suite Teardown      Fechar Navegador


*** Test Cases ***
Acessar o "Onde usar" a partir da seção Pra Você
    [Tags]    frontend    onde_usar
    Given que acesso o site da VR
    When navego até a seção Pra Você
    Then sou direcionado para a página do SuperApp VR
    And vejo o mapa de estabelecimentos como funcionalidade do app


*** Keywords ***
# Keywords no estilo BDD (Given/When/Then), delegando para os Page Objects
que acesso o site da VR
    Acessar a Home

navego até a seção Pra Você
    Navegar Para a Seção Pra Você

sou direcionado para a página do SuperApp VR
    Validar Página do SuperApp Exibida

vejo o mapa de estabelecimentos como funcionalidade do app
    Validar Mapa de Estabelecimentos
