*** Settings ***
Documentation    Keywords referentes aos cenários da página de Conhecimento
Resource         ../../../src/config/package.robot

*** Keywords ***

Quando acessar a tela de cadastro de conhecimento
    Clicar no elemento    ${home_button_sistema_biblioteca}
    Clicar no elemento    ${home_button_conhecimento}
    Clicar no elemento    ${home_button_cadastrar_conhecim}
    Wait Until Element Is Visible    ${conhecimento_titulo_cadastrar}

Quando acessar a tela de busca de conhecimento
    Clicar no elemento    ${home_button_sistema_biblioteca}
    Clicar no elemento    ${home_button_conhecimento}
    Clicar no elemento    ${home_button_buscar_dominio}
    Wait Until Element Is Visible    ${conhecimento_titulo_buscar}

E preencher o campo Título
    Wait Until Element Is Visible    ${conhecimento_input_titulo}
    Wait Until Element Is Enabled    ${conhecimento_input_titulo}
    ${numero_aleatorio}    Generate Random String    length=10    chars=[NUMBERS]
    Set Test Variable    ${nome_teste}    Titulo Conhec Automação ${numero_aleatorio}
    Input Text    ${conhecimento_input_titulo}    ${nome_teste}    clear=True

E preencher o campo Título com valor repetido
    Wait Until Element Is Visible    ${conhecimento_input_titulo}
    Wait Until Element Is Enabled    ${conhecimento_input_titulo}
    Input Text    ${conhecimento_input_titulo}    fgafg    clear=True

E preencher o campo Introdução
    Wait Until Element Is Visible    ${conhecimento_input_introducao}
    Wait Until Element Is Enabled    ${conhecimento_input_introducao}
    ${nome_aleatorio}    Generate Random String    length=100-200    chars=[LETTERS]
    Input Text    ${conhecimento_input_introducao}    ${nome_aleatorio}    clear=True

E selecionar uma categoria
    Sleep    1s
    ${registros}    Get Element Count    ${conhecimento_select_categoria}/option
    ${registro_aleatorio}    Evaluate    random.randint(1, ${registros})
    Clicar no elemento    ${conhecimento_select_categoria}/option[${registro_aleatorio}]

E obter o conteudo do campo Colaborador
    Wait Until Element Is Visible    ${conhecimento_input_colaborador}
    ${nome_colaborador}    Get Value    ${conhecimento_input_colaborador}
    Should Not Be Empty    ${nome_colaborador}

E preencher o campo Título da foto / vídeo
    Wait Until Element Is Visible    ${conhecimento_input_titulo_video}
    Wait Until Element Is Enabled    ${conhecimento_input_titulo_video}
    ${numero_aleatorio}    Generate Random String    length=10    chars=[NUMBERS]
    Input Text    ${conhecimento_input_titulo_video}    Titulo Foto/Video Automação ${numero_aleatorio}    clear=True

E preencher o campo Foto / Vídeo
    Wait Until Element Is Visible    ${conhecimento_input_foto_video}
    Wait Until Element Is Enabled    ${conhecimento_input_foto_video}
    ${numero_aleatorio}    Generate Random String    length=10    chars=[NUMBERS]
    Input Text    ${conhecimento_input_foto_video}    Foto/Vídeo Automação ${numero_aleatorio}    clear=True

E preencher o campo Descrição
    Wait Until Element Is Visible    ${conhecimento_input_descricao}
    Wait Until Element Is Enabled    ${conhecimento_input_descricao}
    ${nome_aleatorio}    Generate Random String    length=100-200    chars=[LETTERS]
    Input Text    ${conhecimento_input_descricao}    ${nome_aleatorio}    clear=True

E conhecimento cadastrado é exibido na listagem geral
    Clicar no elemento               ${home_button_voltar}
    Clicar no elemento               ${home_button_buscar_conhecim}
    Wait Until Element Is Visible    ${conhecimento_titulo_buscar}
    E preencher o campo Buscar       palavra_pesquisada=${nome_teste}
    Então o sistema deve listar a palavra pesquisada    palavra_pesquisada=${nome_teste}

Então o sistema volta para área de Cadastrar conhecimento
    Wait Until Element Is Visible    ${conhecimento_input_titulo}
    Wait Until Element Is Enabled    ${conhecimento_input_titulo}
    ${nome_titulo}    Get Value      ${conhecimento_input_titulo}
    Should Not Be Empty    ${nome_titulo}