*** Settings ***
Documentation       Service Object do endpoint de enumerações do portal VR.
...                 Os testes não conhecem URL nem detalhes HTTP: só pedem os dados a estas keywords.
Library             RequestsLibrary
Library             Collections


*** Variables ***
${API_URL}          https://portal.vr.com.br/api-web/comum
${SESSAO}           portal_vr


*** Keywords ***
Criar Sessão Do Portal VR
    &{headers}    Create Dictionary    Accept=application/json
    # verify=True: o RequestsLibrary não valida o certificado HTTPS por padrão
    Create Session    ${SESSAO}    ${API_URL}    headers=${headers}    timeout=30    verify=${True}

Consultar Enumerações Do Produto
    [Arguments]    ${produto}
    # expected_status=any: a validação do status fica a cargo do teste, com mensagem clara
    ${response}    GET On Session    ${SESSAO}    /enumerations/${produto}    expected_status=any
    RETURN    ${response}
