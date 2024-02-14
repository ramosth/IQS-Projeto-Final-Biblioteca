*** Settings ***
Documentation    Testes de Cadastro de Conhecimento
Resource         ../../src/config/package.robot

Test Setup          Usuário loga no sistema
Test Teardown       Evidenciar teste na pasta    Cadastro_Conhecimento


*** Test Cases ***
Cenário: CT01 - Cadastrar conhecimento como Gestor
    [Tags]    Regression
    Dado que usuário realize login     ${LOGIN_GESTOR.USER_2.EMAIL}    ${LOGIN_GESTOR.USER_2.SENHA}
    E esteja na tela inicial do sistema
    Quando acessar a tela de cadastro de conhecimento
    E validar acesso a tela de    url=${config.browser.url_conhecimento_cadastrar}
    E preencher o campo Título
    E preencher o campo Introdução
    E selecionar uma categoria
    E obter o conteudo do campo Colaborador
    E preencher o campo Título da foto / vídeo
    E preencher o campo Foto / Vídeo
    E preencher o campo Descrição
    E clicar em Cadastrar
    E clicar em Cadastrar
    Então o sistema abre um modal de confirmação de cadastro
    E confirmar o modal clicando em 'Cadastrar'
    Então o sistema exibe um alerta de    alerta=${conhecimento_alerta_cadastro_sucesso}
    E conhecimento cadastrado é exibido na listagem geral

Cenário: CT02 - Cadastrar conhecimento com título já cadastrado como Gestor
    [Tags]    Regression
    Dado que usuário realize login     ${LOGIN_GESTOR.USER_2.EMAIL}    ${LOGIN_GESTOR.USER_2.SENHA}
    E esteja na tela inicial do sistema
    Quando acessar a tela de cadastro de conhecimento
    E validar acesso a tela de    url=${config.browser.url_conhecimento_cadastrar}
    E preencher o campo Título com valor repetido
    E preencher o campo Introdução
    E selecionar uma categoria
    E obter o conteudo do campo Colaborador
    E preencher o campo Título da foto / vídeo
    E preencher o campo Foto / Vídeo
    E preencher o campo Descrição
    E clicar em Cadastrar
    E clicar em Cadastrar
    Então o sistema abre um modal de confirmação de cadastro
    E confirmar o modal clicando em 'Cadastrar'
    Então o sistema exibe um alerta de    alerta=${conhecimento_alerta_titulo_repetido}
    Então o sistema volta para área de Cadastrar conhecimento
