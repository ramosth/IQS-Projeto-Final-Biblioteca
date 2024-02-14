*** Settings ***
Documentation    Testes de Busca de Dominio
Resource         ../../src/config/package.robot

Test Setup          Usuário loga no sistema
Test Teardown       Evidenciar teste na pasta    Busca_Dominio


*** Test Cases ***
Cenário: CT01 - Buscar dominio com sucesso como Gestor
    [Tags]    Regression
    Dado que usuário realize login     ${LOGIN_GESTOR.USER_2.EMAIL}    ${LOGIN_GESTOR.USER_2.SENHA}
    E esteja na tela inicial do sistema
    Quando acessar a tela de busca de dominio
    E validar acesso a tela de    url=${config.browser.url_dominio_buscar}
    E preencher o campo Buscar    palavra_pesquisada=teste
    Então o sistema deve listar a palavra pesquisada    palavra_pesquisada=teste

Cenário: CT02 - Buscar dominio não cadastrada como Gestor
    [Tags]    Regression
    Dado que usuário realize login     ${LOGIN_GESTOR.USER_2.EMAIL}    ${LOGIN_GESTOR.USER_2.SENHA}
    E esteja na tela inicial do sistema
    Quando acessar a tela de busca de dominio
    E validar acesso a tela de    url=${config.browser.url_dominio_buscar}
    E preencher o campo Buscar    palavra_pesquisada=Lorem Ipsum
    Então o sistema não deve listar a palavra pesquisada    palavra_pesquisada=Lorem Ipsum

Cenário: CT03 - Buscar dominio configurando a quantidade de itens por página como Gestor
    [Tags]    Regression
    Dado que usuário realize login     ${LOGIN_GESTOR.USER_2.EMAIL}    ${LOGIN_GESTOR.USER_2.SENHA}
    E esteja na tela inicial do sistema
    Quando acessar a tela de busca de dominio
    E validar acesso a tela de    url=${config.browser.url_dominio_buscar}
    E clicar na quantidade de itens    ${10}
    E clicar na quantidade de itens    ${25}
    E clicar na quantidade de itens    ${50}
    E clicar na quantidade de itens    ${100}

Cenário: CT04 - Buscar dominio de acordo com a paginação como Gestor
    [Tags]    Regression
    Dado que usuário realize login     ${LOGIN_GESTOR.USER_2.EMAIL}    ${LOGIN_GESTOR.USER_2.SENHA}
    E esteja na tela inicial do sistema
    Quando acessar a tela de busca de dominio
    E validar acesso a tela de    url=${config.browser.url_dominio_buscar}
    E clicar na paginação    ${common_tabela_paginacao_proximo}
    Então o sistema deve listar a 'segunda' página
    E clicar na paginação    ${common_tabela_paginacao_primeiro}
    Então o sistema deve listar a 'primeira' página
    E clicar na paginação    ${common_tabela_paginacao_ultimo}
    Então o sistema deve listar a 'última' página
    E clicar na paginação    ${common_tabela_paginacao_anterior}
    Então o sistema deve listar a 'anterior' página

Cenário: CT05 - Voltar da tela de Buscar dominio
    [Tags]    Regression
    Dado que usuário realize login     ${LOGIN_GESTOR.USER_2.EMAIL}    ${LOGIN_GESTOR.USER_2.SENHA}
    E esteja na tela inicial do sistema
    Quando acessar a tela de busca de dominio
    E validar acesso a tela de    url=${config.browser.url_dominio_buscar}
    E clicar em Voltar
    Então o sistema volta para tela de Menu de Dominio

Cenário: CT06 - Alterar dominio como Gestor
    [Tags]    Regression
    Dado que usuário realize login     ${LOGIN_GESTOR.USER_2.EMAIL}    ${LOGIN_GESTOR.USER_2.SENHA}
    E esteja na tela inicial do sistema
    Quando acessar a tela de busca de dominio
    E validar acesso a tela de    url=${config.browser.url_dominio_buscar}
    E clicar em um item para 'Alterar dominio'
    E validar acesso a tela de    url=${config.browser.url_dominio_alterar}
    E preencher o campo Nome em dominio
    E clicar em Alterar
    Então o sistema abre um modal de confirmação de alteração
    E confirmar o modal clicando em 'Alterar'
    Então o sistema exibe um alerta de    alerta=${dominio_alerta_alteracao_sucesso}
    E item editado é exibido na listagem geral

Cenário: CT07 - Excluir dominio como Gestor
    [Tags]    Regression
    Dado que usuário realize login     ${LOGIN_GESTOR.USER_2.EMAIL}    ${LOGIN_GESTOR.USER_2.SENHA}
    E esteja na tela inicial do sistema
    Quando acessar a tela de busca de dominio
    E validar acesso a tela de    url=${config.browser.url_dominio_buscar}
    E clicar em um item para 'Excluir dominio'
    Então o sistema abre um modal de confirmação de exclusão
    E confirmar o modal clicando em 'Deletar'
    Então o sistema exibe um alerta de    alerta=${dominio_alerta_exclusao_sucesso}
    E item inativado não é exibido na listagem geral

Cenário: CT08 - Buscar dominio inativo como Gestor
    [Tags]    Regression
    Dado que usuário realize login     ${LOGIN_GESTOR.USER_2.EMAIL}    ${LOGIN_GESTOR.USER_2.SENHA}
    E esteja na tela inicial do sistema
    Quando acessar a tela de busca de dominio
    E validar acesso a tela de    url=${config.browser.url_dominio_buscar}
    E clicar em Inativos
    E validar acesso a tela de    url=${config.browser.url_dominio_inativas}
    E preencher o campo Buscar    palavra_pesquisada=teste
    Então o sistema deve listar a palavra pesquisada    palavra_pesquisada=teste

Cenário: CT09 - Ativar dominio inativa como Gestor
    [Tags]    Regression
    Dado que usuário realize login     ${LOGIN_GESTOR.USER_2.EMAIL}    ${LOGIN_GESTOR.USER_2.SENHA}
    E esteja na tela inicial do sistema
    Quando acessar a tela de busca de dominio
    E validar acesso a tela de    url=${config.browser.url_dominio_buscar}
    E clicar em Inativos
    E validar acesso a tela de    url=${config.browser.url_dominio_inativas}
    E clicar em um item para 'Ativar dominio'
    E confirmar o modal clicando em 'Ativar'
    Então o sistema exibe um alerta de    alerta=${dominio_alerta_ativada_sucesso}
    E item inativado não é exibido na listagem geral
    E item ativado é exibido na listagem geral

