*** Settings ***
Documentation    Keywords referentes aos cenários da página de Categoria
Resource         ../../../src/config/package.robot

*** Keywords ***

Quando acessar a tela de cadastro de categoria
    Clicar no elemento    ${home_button_sistema_biblioteca}
    Clicar no elemento    ${home_button_categoria}
    Clicar no elemento    ${home_button_cadastrar_categ}
    Wait Until Element Is Visible    ${categoria_titulo_cadastrar}

Quando acessar a tela de busca de categoria
    Clicar no elemento    ${home_button_sistema_biblioteca}
    Clicar no elemento    ${home_button_categoria}
    Clicar no elemento    ${home_button_buscar_categ}
    Wait Until Element Is Visible    ${categoria_titulo_buscar}

E preencher o campo Nome
    Wait Until Element Is Visible    ${categoria_input_nome}
    Wait Until Element Is Enabled    ${categoria_input_nome}
    ${nome_aleatorio}    Generate Random String    length=10-20    chars=[LETTERS]
    Set Test Variable    ${nome_teste}    ${nome_aleatorio}
    Input Text    ${categoria_input_nome}    ${nome_aleatorio}    clear=True

E selecionar um domínio
    Sleep    1s
    ${registros}    Get Element Count    ${categoria_select_dominio}/option
    ${registro_aleatorio}    Evaluate    random.randint(1, ${registros})
    Clicar no elemento    ${categoria_select_dominio}/option[${registro_aleatorio}]

E selecionar um domínio para alterar
    Sleep    1s
    ${registros}    Get Element Count    ${categoria_select_dominio_selecionado}/option
    ${registro_aleatorio}    Evaluate    random.randint(1, ${registros})
    Sleep    1s
    Clicar no elemento    ${categoria_select_dominio_selecionado}/option[${registro_aleatorio}]

E preencher o campo Buscar
    [Arguments]    ${palavra_pesquisada}=${None}
    Wait Until Element Is Visible    ${common_input_buscar}
    Wait Until Element Is Enabled    ${common_input_buscar}
    Input Text    ${common_input_buscar}    ${palavra_pesquisada}

Então o sistema abre um modal de confirmação de cadastro
    Wait Until Element Is Visible    ${common_modal_titulo}
    Wait Until Element Is Enabled    ${common_modal_titulo}
    Element Should Be Visible        ${common_modal_titulo}
    Element Should Be Visible        ${common_modal_texto}
    Element Should Be Visible        ${home_button_modal_cadastrar}
    Element Should Be Visible        ${home_button_modal_cancelar}
    Element Should Be Visible        ${home_button_modal_fechar}

Então o sistema deixa o campo Nome da categoria em vermelho
    Wait Until Element is Visible    ${categoria_input_nome}
    Wait Until Element Is Enabled    ${categoria_input_nome}
    ${atributos}    SeleniumLibrary.Get Element Attribute
    ...    ${categoria_input_nome}
    ...    class
    Should Contain    ${atributos}    is-invalid

E exibe uma mensagem de preenchimento obrigatório do campo Nome da categoria
    Wait Until Element is Visible    ${common_alerta_campo_nome_obrigatorio}
    Wait Until Element Is Enabled    ${common_alerta_campo_nome_obrigatorio}
    Element Should Be Visible        ${common_alerta_campo_nome_obrigatorio}
    ${texto}    Get Text             ${common_alerta_campo_nome_obrigatorio}
    Should Be Equal      ${texto}    ${home_mensagem_campo_obrigatorio}

Então o sistema volta para tela de Menu de Categoria
    E validar acesso a tela de       url=${config.browser.url_categoria_menu}
    Wait Until Element Is Visible    ${home_button_cadastrar_categ}
    Wait Until Element Is Enabled    ${home_button_cadastrar_categ}
    Element Should Be Visible        ${home_button_cadastrar_categ}
    Element Should Be Visible        ${home_button_buscar_categ}

Então o sistema volta para tela de Sistema Biblioteca
    E validar acesso a tela de       url=${config.browser.url_sistema_biblioteca}
    Wait Until Element Is Visible    ${home_button_dominio}
    Wait Until Element Is Enabled    ${home_button_dominio}
    Element Should Be Visible        ${home_button_dominio}
    Element Should Be Visible        ${home_button_categoria}
    Element Should Be Visible        ${home_button_conhecimento}

Então o sistema deve listar a palavra pesquisada
    [Arguments]    ${palavra_pesquisada}
    Sleep    1s
    ${linha}    SeleniumLibrary.Get Element Count    ${common_tabela_buscar}/tbody/tr

    FOR    ${counter}    IN RANGE    1    ${linha} + 1
        ${texto_linha}    Get Text    ${common_tabela_buscar}/tbody/tr[${counter}]/td[1]

        ${verifica_palavra_tabela}    Run Keyword And Return Status
        ...    Should Contain
        ...    ${texto_linha}
        ...    ${palavra_pesquisada}
        ...    ignore_case = True
        ...    strip_spaces = True
        ...    collapse_spaces = True

        IF    ${verifica_palavra_tabela}
            CONTINUE
        ELSE
            Fail    Foi encontrado na tabela resultado diferente da palavra '${palavra_pesquisada}' esperada.
        END
    END
    ${texto_linha}    Get Text       ${common_tabela_total_registros}
    Should Not Contain    ${texto_linha}    0

Então o sistema não deve listar a palavra pesquisada
    [Arguments]    ${palavra_pesquisada}
    Sleep    1s
    ${linha}    SeleniumLibrary.Get Element Count    ${common_tabela_buscar}/tbody/tr

    FOR    ${counter}    IN RANGE    1    ${linha} + 1
        ${texto_linha}    Get Text    ${common_tabela_buscar}/tbody/tr[${counter}]/td[1]

        ${verifica_palavra_tabela}    Run Keyword And Return Status
        ...    Should Be Equal
        ...    ${texto_linha}
        ...    ${palavra_pesquisada}

        IF    ${verifica_palavra_tabela}
            Fail    Foi encontrado na tabela a palavra '${palavra_pesquisada}' não esperada.
        ELSE
            CONTINUE
        END
    END
    ${texto_linha}    Get Text       ${common_tabela_total_registros}
    Should Contain    ${texto_linha}    0

E clicar na paginação
    [Arguments]    ${pagina}
    Scroll Element Into View    ${common_tabela_paginacao_proximo}
    Sleep    2s
    Clicar no elemento    ${pagina}

Então o sistema deve listar a ${paginacao} página
    Wait Until Element Is Visible    ${common_tabela_paginacao_texto}
    Wait Until Element Is Enabled    ${common_tabela_paginacao_texto}
    ${texto}    Get Text             ${common_tabela_paginacao_texto}
    IF    ${paginacao} == 'primeira'
        Should Contain    ${texto}    1 de
    ELSE IF    ${paginacao} == 'segunda'
        Should Contain    ${texto}    2 de
    ELSE IF    ${paginacao} == 'última'
        ${nome_array}      Split String    ${texto}    ${SPACE}de${SPACE}
        Should Be Equal    ${nome_array}[0]    ${nome_array}[1]
    ELSE IF    ${paginacao} == 'anterior'
        Scroll Element Into View    ${common_tabela_paginacao_anterior}
        ${nome_array}      Split String    ${texto}    ${SPACE}de${SPACE}
        ${valor_final}    Evaluate    ${nome_array}[1] - ${1}
        Sleep    1s
        Should Contain    ${texto}    ${valor_final} de ${nome_array}[1]
    END

E clicar na quantidade de itens
    [Arguments]    ${qtd_itens}
    Scroll Element Into View         ${common_tabela_select_quant_itens}
    Clicar no elemento    ${common_tabela_select_quant_itens}/option[.='${qtd_itens}']
    Sleep    1s

E clicar em um item para ${ação}
    IF    ${ação} == 'Alterar'
        Clicar no elemento    ${common_tabela_buscar}/tbody/tr[1]/td[3]
    ELSE IF    ${ação} == 'Excluir'
        Wait Until Element Is Visible    ${common_tabela_buscar}/tbody/tr[1]/td[1]
        Wait Until Element Is Enabled    ${common_tabela_buscar}/tbody/tr[1]/td[1]
        ${nome_exclusao}      Get Text    ${common_tabela_buscar}/tbody/tr[1]/td[1]
        Set Test Variable    ${nome_teste}    ${nome_exclusao}
        Clicar no elemento    ${common_tabela_buscar}/tbody/tr[1]/td[4]
    ELSE IF    ${ação} == 'Ativar'
        Wait Until Element Is Visible    ${common_tabela_buscar}/tbody/tr[1]/td[1]
        Wait Until Element Is Enabled    ${common_tabela_buscar}/tbody/tr[1]/td[1]
        ${nome_ativar}      Get Text    ${common_tabela_buscar}/tbody/tr[1]/td[1]
        Set Test Variable    ${nome_teste}    ${nome_ativar}
        Clicar no elemento    ${common_tabela_buscar}/tbody/tr[1]/td[3]
    ELSE IF    ${ação} == 'Alterar dominio'
        Clicar no elemento    ${common_tabela_buscar}/tbody/tr[1]/td[2]
    ELSE IF    ${ação} == 'Excluir dominio'
        Wait Until Element Is Visible    ${common_tabela_buscar}/tbody/tr[3]/td[1]
        Wait Until Element Is Enabled    ${common_tabela_buscar}/tbody/tr[3]/td[1]
        ${nome_exclusao}      Get Text    ${common_tabela_buscar}/tbody/tr[3]/td[1]
        Set Test Variable    ${nome_teste}    ${nome_exclusao}
        Clicar no elemento    ${common_tabela_buscar}/tbody/tr[3]/td[3]
    ELSE IF    ${ação} == 'Ativar dominio'
        Wait Until Element Is Visible    ${common_tabela_buscar}/tbody/tr[1]/td[1]
        Wait Until Element Is Enabled    ${common_tabela_buscar}/tbody/tr[1]/td[1]
        ${nome_ativar}      Get Text    ${common_tabela_buscar}/tbody/tr[1]/td[1]
        Set Test Variable    ${nome_teste}    ${nome_ativar}
        Clicar no elemento    ${common_tabela_buscar}/tbody/tr[1]/td[2]
    END

Então o sistema abre um modal de confirmação de alteração
    Wait Until Element Is Visible    ${common_modal_titulo}
    Wait Until Element Is Enabled    ${common_modal_titulo}
    Element Should Be Visible        ${common_modal_titulo}
    Element Should Be Visible        ${common_modal_texto}
    Element Should Be Visible        ${home_button_alterar}
    Element Should Be Visible        ${home_button_modal_cancelar}
    Element Should Be Visible        ${home_button_modal_fechar}

Então o sistema abre um modal de confirmação de exclusão
    Wait Until Element Is Visible    ${common_modal_titulo}
    Wait Until Element Is Enabled    ${common_modal_titulo}
    Element Should Be Visible        ${common_modal_titulo}
    Element Should Be Visible        ${common_modal_texto}
    Element Should Be Visible        ${home_button_deletar}
    Element Should Be Visible        ${home_button_modal_cancelar}
    Element Should Be Visible        ${home_button_modal_fechar}

E categoria cadastrada é exibida na listagem geral
    Clicar no elemento               ${home_button_voltar}
    Clicar no elemento               ${home_button_buscar_categ}
    Wait Until Element Is Visible    ${categoria_titulo_buscar}
    E preencher o campo Buscar       palavra_pesquisada=${nome_teste}
    Então o sistema deve listar a palavra pesquisada    palavra_pesquisada=${nome_teste}

E item editado é exibido na listagem geral
    Wait Until Element Is Visible    ${common_input_buscar}
    E preencher o campo Buscar       palavra_pesquisada=${nome_teste}
    Então o sistema deve listar a palavra pesquisada    palavra_pesquisada=${nome_teste}

E item inativado não é exibido na listagem geral
    Wait Until Element Is Visible    ${common_input_buscar}
    E preencher o campo Buscar       palavra_pesquisada=${nome_teste}
    Então o sistema não deve listar a palavra pesquisada    palavra_pesquisada=${nome_teste}

E clicar em Inativas
    Clicar no elemento    ${categoria_button_inativas}

E item ativado é exibido na listagem geral
    Scroll Element Into View         ${home_button_voltar}
    Clicar no elemento               ${home_button_voltar}
    Sleep    1s
    E preencher o campo Buscar       palavra_pesquisada=${nome_teste}
    Então o sistema deve listar a palavra pesquisada    palavra_pesquisada=${nome_teste}

Então o sistema volta para tela Cadastrar categoria
    E validar acesso a tela de    url=${config.browser.url_categoria_cadastrar}