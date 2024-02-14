*** Settings ***
Documentation    Keywords referentes aos cenários de Login
Resource         ../../../src/config/package.robot

*** Keywords ***

Dado que usuário realize login
    [Arguments]    ${username}    ${senha}
    Wait Until Element Is Visible    ${login_logo}
    Wait Until Element Is Visible    ${login_input_login}
    Input Text                       ${login_input_login}    ${username}
    Wait Until Element Is Visible    ${login_input_senha}
    Input Text                       ${login_input_senha}    ${senha}
    Click Element                    ${login_button_login}

E esteja na tela inicial do sistema
    Wait Until Element Is Visible   ${home_saudacao}
    ${usuario}      Get Text        ${home_saudacao}
    Should Contain    ${usuario}    Bem-vindo(a)
