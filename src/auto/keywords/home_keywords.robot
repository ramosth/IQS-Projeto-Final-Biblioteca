*** Settings ***
Documentation    Keywords referentes aos cenários da página de Home
Resource         ../../../src/config/package.robot

*** Keywords ***

Quando acessar o sistema de Biblioteca
    Clicar no elemento    ${home_button_sistema_biblioteca}

Quando clicar para sair da aplicação
    Clicar no elemento    ${home_button_logout}

Então o sistema abre um modal de confirmação de logout
    Wait Until Element Is Visible    ${categoria_modal_titulo}
    Wait Until Element Is Enabled    ${categoria_modal_titulo}
    Element Should Be Visible        ${categoria_modal_titulo}
    Element Should Be Visible        ${categoria_modal_texto}
    Element Should Be Visible        ${home_button_modal_não}
    Element Should Be Visible        ${home_button_modal_sim}
    Element Should Be Visible        ${home_button_modal_fechar}

Então o sistema volta para tela de Login
    Wait Until Element Is Visible    ${login_logo}
    Wait Until Element Is Visible    ${login_input_login}
    Element Should Be Visible        ${login_input_login}

