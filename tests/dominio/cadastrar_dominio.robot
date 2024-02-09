*** Settings ***
Documentation    Testes de Cadastro de Domínio
Resource         ../../src/config/package.robot

Test Setup          Usuário loga no sistema
Test Teardown       Evidenciar teste na pasta    Cadastro_Domínio


*** Test Cases ***
Cenário: CT01 - Cadastrar dominio como Gestor
    [Tags]    Regression
    Dado que usuário realize login     ${LOGIN_GESTOR.USER_2.EMAIL}    ${LOGIN_GESTOR.USER_2.SENHA}
    E esteja na tela inicial do sistema
    Quando acessar a tela de cadastro de dominio
    E validar acesso a tela de    url=${config.browser.url_dominio_cadastrar}
    E preencher o campo Nome em dominio
    E clicar em Cadastrar
    Então o sistema abre um modal de confirmação de cadastro
    E confirmar o modal clicando em 'Cadastrar'
    Então o sistema exibe um alerta de    alerta=${dominio_alerta_cadastro_sucesso}
    E dominio cadastrado é exibido na listagem geral

Cenário: CT02 - Cadastrar dominio sem informar o nome da dominio como Gestor
    [Tags]    Regression
    Dado que usuário realize login     ${LOGIN_GESTOR.USER_2.EMAIL}    ${LOGIN_GESTOR.USER_2.SENHA}
    E esteja na tela inicial do sistema
    Quando acessar a tela de cadastro de dominio
    E validar acesso a tela de    url=${config.browser.url_dominio_cadastrar}
    E clicar em Cadastrar
    Então o sistema deixa o campo Nome da categoria em vermelho
    E exibe uma mensagem de preenchimento obrigatório do campo Nome da categoria

Cenário: CT03 - Voltar da tela de Cadastrar dominio
    [Tags]    Regression
    Dado que usuário realize login     ${LOGIN_GESTOR.USER_2.EMAIL}    ${LOGIN_GESTOR.USER_2.SENHA}
    E esteja na tela inicial do sistema
    Quando acessar a tela de cadastro de dominio
    E validar acesso a tela de    url=${config.browser.url_dominio_cadastrar}
    E preencher o campo Nome em dominio
    E clicar em Voltar
    Então o sistema volta para tela de Menu de Dominio

Cenário: CT04 - Voltar da tela de Menu de dominio
    [Tags]    Regression
    Dado que usuário realize login     ${LOGIN_GESTOR.USER_2.EMAIL}    ${LOGIN_GESTOR.USER_2.SENHA}
    E esteja na tela inicial do sistema
    Clicar no elemento    ${home_button_sistema_biblioteca}
    Clicar no elemento    ${home_button_dominio}
    E clicar em Voltar
    Então o sistema volta para tela de Sistema Biblioteca

Cenário: CT05 - Deslogar a partir da tela de Cadastrar dominio como Gestor
    [Tags]    Regression
    Dado que usuário realize login     ${LOGIN_GESTOR.USER_2.EMAIL}    ${LOGIN_GESTOR.USER_2.SENHA}
    E esteja na tela inicial do sistema
    Quando acessar a tela de cadastro de dominio
    E validar acesso a tela de    url=${config.browser.url_dominio_cadastrar}
    Quando clicar para sair da aplicação
    E confirmar o modal clicando em 'Sim'
    Então o sistema volta para tela de Login

Cenário: CT06 - Cancelar logout a partir da tela de Cadastrar dominio como Gestor
    [Tags]    Regression
    Dado que usuário realize login     ${LOGIN_GESTOR.USER_2.EMAIL}    ${LOGIN_GESTOR.USER_2.SENHA}
    E esteja na tela inicial do sistema
    Quando acessar a tela de cadastro de dominio
    E validar acesso a tela de    url=${config.browser.url_dominio_cadastrar}
    Quando clicar para sair da aplicação
    E confirmar o modal clicando em 'Não'
    Então o sistema volta para tela Buscar dominio
