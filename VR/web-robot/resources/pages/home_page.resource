*** Settings ***
Documentation       Page Object da página inicial (www.vr.com.br).
Resource            ../base.resource


*** Variables ***
# logo no cabeçalho: âncora estável para confirmar que a home carregou
${HOME_LOGO}                css:header a[href="/"]
${HOME_ACEITAR_COOKIES}     id:onetrust-accept-btn-handler


*** Keywords ***
Acessar a Home
    Go To    ${BASE_URL}/
    Wait Until Element Is Visible    ${HOME_LOGO}
    Aceitar Cookies Se Exibido

Aceitar Cookies Se Exibido
    [Documentation]    Fecha o banner de cookies (LGPD) se ele aparecer; não falha quando não é exibido.
    ${exibido}    Run Keyword And Return Status
    ...    Wait Until Element Is Visible    ${HOME_ACEITAR_COOKIES}    timeout=5s
    IF    ${exibido}    Click Element    ${HOME_ACEITAR_COOKIES}

Navegar Para a Seção Pra Você
    [Documentation]    A seção "Pra Você" saiu do menu; o enunciado indica o endereço /onde-aceita.htm,
    ...                que é usado para validar o redirecionamento do link legado.
    Go To    ${BASE_URL}/onde-aceita.htm
