*** Settings ***
Documentation       Configurações e keywords comuns a todos os testes de frontend.
Library             SeleniumLibrary    timeout=15s    run_on_failure=Capture Page Screenshot
Library             libs/drivers.py


*** Variables ***
${BASE_URL}         https://www.vr.com.br
${BROWSER}          headlesschrome
# Para ver o navegador: robot --variable BROWSER:chrome -d results tests


*** Keywords ***
Abrir Navegador
    [Documentation]    Abre o Chrome em viewport desktop (headless por padrão).
    ${chromedriver}    Obter Caminho Do Chromedriver
    Open Browser    about:blank    ${BROWSER}    service=executable_path='${chromedriver}'
    Set Window Size    1366    768

Fechar Navegador
    Close All Browsers
