*** Settings ***
Documentation       Page Object da página do SuperApp VR (/superapp).
...                 No site atual, /onde-aceita.htm redireciona para cá e o "Onde usar" (mapa de
...                 estabelecimentos) passou a ser uma funcionalidade do app apresentada nesta página.
Resource            ../base.resource


*** Variables ***
${SUPERAPP_TITULO}          xpath://h2[contains(normalize-space(.), 'O SuperApp VR é completão')]
${SUPERAPP_ONDE_USAR}       xpath://p[contains(normalize-space(.), 'Onde usar:') and contains(., 'mapa de estabelecimentos')]
# filtra pelo id do app para não pegar outros apps citados no rodapé
${SUPERAPP_LINKS_LOJAS}     css:a[href*="apps.apple.com/br/app/superapp-vr"], a[href*="play.google.com"][href*="id=ws.hanzo.Vrrh"]


*** Keywords ***
Validar Página do SuperApp Exibida
    Wait Until Location Contains    /superapp
    Wait Until Element Is Visible    ${SUPERAPP_TITULO}

Validar Mapa de Estabelecimentos
    Scroll Element Into View    ${SUPERAPP_ONDE_USAR}
    Element Should Be Visible    ${SUPERAPP_ONDE_USAR}
    # sem os links das lojas o usuário não chega ao mapa, então eles também são validados
    ${qtd_links}    Get Element Count    ${SUPERAPP_LINKS_LOJAS}
    Should Be True    ${qtd_links} > 0    Nenhum link de loja do SuperApp VR encontrado
