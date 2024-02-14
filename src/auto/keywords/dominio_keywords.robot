*** Settings ***
Documentation    Keywords referentes aos cenários da página de Dominio
Resource         ../../../src/config/package.robot

*** Keywords ***

Quando acessar a tela de cadastro de dominio
    Clicar no elemento    ${home_button_sistema_biblioteca}
    Clicar no elemento    ${home_button_dominio}
    Clicar no elemento    ${home_button_cadastrar_dominio}
    Wait Until Element Is Visible    ${dominio_titulo_cadastrar}

Quando acessar a tela de busca de dominio
    Clicar no elemento    ${home_button_sistema_biblioteca}
    Clicar no elemento    ${home_button_dominio}
    Clicar no elemento    ${home_button_buscar_dominio}
    Wait Until Element Is Visible    ${dominio_titulo_buscar}

E preencher o campo Nome em dominio
    Wait Until Element Is Visible    ${dominio_input_nome}
    Wait Until Element Is Enabled    ${dominio_input_nome}
    ${nome_aleatorio}    Generate Random String    length=10-20    chars=[LETTERS]
    Set Test Variable    ${nome_teste}    ${nome_aleatorio}
    Input Text    ${dominio_input_nome}    ${nome_aleatorio}    clear=True

Então o sistema deixa o campo Nome da dominio em vermelho
    Wait Until Element is Visible    ${dominio_input_nome}
    Wait Until Element Is Enabled    ${dominio_input_nome}
    ${atributos}    SeleniumLibrary.Get Element Attribute
    ...    ${dominio_input_nome}
    ...    class
    Should Contain    ${atributos}    is-invalid

E dominio cadastrado é exibido na listagem geral
    Clicar no elemento               ${home_button_voltar}
    Clicar no elemento               ${home_button_buscar_dominio}
    Wait Until Element Is Visible    ${dominio_titulo_buscar}
    E preencher o campo Buscar       palavra_pesquisada=${nome_teste}
    Então o sistema deve listar a palavra pesquisada    palavra_pesquisada=${nome_teste}

Então o sistema volta para tela de Menu de Dominio
    E validar acesso a tela de       url=${config.browser.url_dominio_menu}
    Wait Until Element Is Visible    ${home_button_cadastrar_dominio}
    Wait Until Element Is Enabled    ${home_button_cadastrar_dominio}
    Element Should Be Visible        ${home_button_cadastrar_dominio}
    Element Should Be Visible        ${home_button_buscar_dominio}

Então o sistema volta para tela Buscar dominio
    E validar acesso a tela de    url=${config.browser.url_dominio_cadastrar}

E clicar em Inativos
    Clicar no elemento    ${dominio_button_inativos}
