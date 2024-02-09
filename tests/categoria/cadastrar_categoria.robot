*** Settings ***
Documentation    Testes de Cadastro de Categoria
Resource         ../../src/config/package.robot

Test Setup          Usuário loga no sistema
Test Teardown       Evidenciar teste na pasta    Cadastro_Categoria


*** Test Cases ***
Cenário: CT01 - Cadastrar categoria como Gestor
    [Tags]    Regression
    Dado que usuário realize login     ${LOGIN_GESTOR.USER_2.EMAIL}    ${LOGIN_GESTOR.USER_2.SENHA}
    E esteja na tela inicial do sistema
    Quando acessar a tela de cadastro de categoria
    E validar acesso a tela de    url=${config.browser.url_categoria_cadastrar}
    E preencher o campo Nome
    E selecionar um domínio
    E clicar em Cadastrar
    Então o sistema abre um modal de confirmação de cadastro
    E confirmar o modal clicando em 'Cadastrar'
    Então o sistema exibe um alerta de    alerta=${categoria_alerta_cadastro_sucesso}
    E categoria cadastrada é exibida na listagem geral

Cenário: CT02 - Cadastrar categoria sem informar o nome da categoria como Gestor
    [Tags]    Regression
    Dado que usuário realize login     ${LOGIN_GESTOR.USER_2.EMAIL}    ${LOGIN_GESTOR.USER_2.SENHA}
    E esteja na tela inicial do sistema
    Quando acessar a tela de cadastro de categoria
    E validar acesso a tela de    url=${config.browser.url_categoria_cadastrar}
    E clicar em Cadastrar
    Então o sistema deixa o campo Nome da categoria em vermelho
    E exibe uma mensagem de preenchimento obrigatório do campo Nome da categoria

Cenário: CT03 - Cadastrar categoria sem informar domínio como Gestor
    [Tags]    Regression
    Dado que usuário realize login     ${LOGIN_GESTOR.USER_2.EMAIL}    ${LOGIN_GESTOR.USER_2.SENHA}
    E esteja na tela inicial do sistema
    Quando acessar a tela de cadastro de categoria
    E validar acesso a tela de    url=${config.browser.url_categoria_cadastrar}
    E preencher o campo Nome
    E clicar em Cadastrar
    Então o sistema abre um modal de confirmação de cadastro
    E confirmar o modal clicando em 'Cadastrar'
    Então o sistema exibe um alerta de    alerta=${categoria_alerta_cadastro_erro}

Cenário: CT04 - Voltar da tela de Cadastrar categoria
    [Tags]    Regression
    Dado que usuário realize login     ${LOGIN_GESTOR.USER_2.EMAIL}    ${LOGIN_GESTOR.USER_2.SENHA}
    E esteja na tela inicial do sistema
    Quando acessar a tela de cadastro de categoria
    E validar acesso a tela de    url=${config.browser.url_categoria_cadastrar}
    E preencher o campo Nome
    E selecionar um domínio
    E clicar em Voltar
    Então o sistema volta para tela de Menu de Categoria

Cenário: CT05- Voltar da tela de Menu de categoria
    [Tags]    Regression
    Dado que usuário realize login     ${LOGIN_GESTOR.USER_2.EMAIL}    ${LOGIN_GESTOR.USER_2.SENHA}
    E esteja na tela inicial do sistema
    Clicar no elemento    ${home_button_sistema_biblioteca}
    Clicar no elemento    ${home_button_categoria}
    E clicar em Voltar
    Então o sistema volta para tela de Sistema Biblioteca

Cenário: CT06 - Deslogar a partir da tela de Cadastrar categoria como Gestor
    [Tags]    Regression
    Dado que usuário realize login     ${LOGIN_GESTOR.USER_2.EMAIL}    ${LOGIN_GESTOR.USER_2.SENHA}
    E esteja na tela inicial do sistema
    Quando acessar a tela de cadastro de categoria
    E validar acesso a tela de    url=${config.browser.url_categoria_cadastrar}
    Quando clicar para sair da aplicação
    E confirmar o modal clicando em 'Sim'
    Então o sistema volta para tela de Login

Cenário: CT07 - Cancelar logout a partir da tela de Cadastrar categoria como Gestor
    [Tags]    Regression
    Dado que usuário realize login     ${LOGIN_GESTOR.USER_2.EMAIL}    ${LOGIN_GESTOR.USER_2.SENHA}
    E esteja na tela inicial do sistema
    Quando acessar a tela de cadastro de categoria
    E validar acesso a tela de    url=${config.browser.url_categoria_cadastrar}
    Quando clicar para sair da aplicação
    E confirmar o modal clicando em 'Não'
    Então o sistema volta para tela Cadastrar categoria
