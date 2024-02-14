*** Settings ***
Documentation    Arquivo de Setup And Teardown
Resource            ../../src/config/package.robot


*** Keywords ***

Abrir Site
    # Adiciona todos os downloads de files no caminho src/utils/files/downloads
    ${download_directory}    Join Path    ${EXECDIR}    src    utils    files    downloads
    ${prefs}    Create Dictionary    download.default_directory=${download_directory}    safebrowsing.enabled=True

    Open Browser  ${config.browser.url_login}    ${config.browser.name}    options=add_experimental_option("prefs",${prefs});add_experimental_option("excludeSwitches", ["enable-logging"]);add_experimental_option('useAutomationExtension', False);add_argument('--disable-blink-features=AutomationControlled');add_experimental_option("excludeSwitches", ["enable-automation"])
    Maximize Browser Window

Usuário loga no sistema
    # Cria a pasta downloads para evitar que testes falhem.
    ${download_outputdir}    Join Path    ${EXECDIR}    src    utils    files    downloads
    Create Directory    ${download_outputdir}
    # Adiciona todos os downloads de files no caminho src/utils/files/downloads
    Abrir Site
    Organizar arquivos de log    directory=${EXECDIR}    action=deletar    file_extension=png

Evidenciar teste na pasta
    [Arguments]    ${folder}
    # formata data para registro da evidencia
    ${date}    Get Time
    ${date_string}    Convert To String    ${date}
    ${date_formated}    Replace String    ${date_string}    :    _
    ${only_hour}    Split String    ${date_formated}    separator=${EMPTY}

    # formata data para criar pasta do dia
    ${only_date}    Split String    ${date_string}    separator=${EMPTY}
    ${date_splited}    Split String    ${only_date[0]}    separator=-

    Set Test Variable    ${year}    ${date_splited[0]}
    Set Test Variable    ${month}    ${date_splited[1]}
    Set Test Variable    ${day}    ${date_splited[2]}

    ${full_directory}    Convert To String    ${config.files.screenshot_outputted} ${day}-${month}-${year}/${folder}
    Create Directory    ${full_directory}
    Set Screenshot Directory    ${full_directory}
    ${string_name}    Convert To String    ${TEST_NAME}
    ${nome_cenario}    Remove String    ${string_name}    Cenário:

    Sleep    1s

    IF    '${TEST_STATUS}' == 'PASS'
        Capture Page Screenshot    filename=${nome_cenario} [ SUCESSO ] ${only_hour[1]}.png
    ELSE IF    '${TEST_STATUS}' == 'FAIL'
        Capture Page Screenshot    filename=${nome_cenario} [ FALHA ] ${only_hour[1]}.png
    END

    Close All Browsers

    Organizar arquivos de log    deletar    csv
    Organizar arquivos de log    deletar    pdf
    Organizar arquivos de log    deletar    zip
    Organizar arquivos de log    deletar    xml

Organizar arquivos de log
    [Arguments]    ${action}    ${file_extension}    ${folder}=${None}    ${directory}=${EXECDIR}//src//utils//files//downloads
    ${directory_list}    List Files In Directory    ${directory}    *.${file_extension}
    IF    '${action}' == 'mover'
        Create Directory    ${folder}
        FOR    ${item}    IN    @{directory_list}
            Move File    ${item}    ${folder}
            Log To Console    ${item} movido para pasta ${folder}
        END
    ELSE IF    '${action}' == 'deletar'
        FOR    ${item}    IN    @{directory_list}
            Remove File    ${directory}/${item}
            Log To Console    ${item} deletado!!
        END
    END

Trocar para aba
    [Arguments]    ${value}    ${locator}=url
    Sleep    3s
    ${url_nova}    Set Variable    https://rsk-portal-dsv.riskpack.com.br/#/${value}
    Switch Window    ${locator}:${url_nova}    timeout=${config.browser.implicity_wait}

Retornar para aba
    [Arguments]    ${path}
    Sleep    1s
    Switch Window    url:https://rsk-upload-dsv.riskpack.com.br/#/${path}

Clicar no elemento
    [Arguments]    ${botao}
    Wait Until Element Is Visible    ${botao}
    Wait Until Element Is Enabled    ${botao}
    Click Element                    ${botao}

E validar acesso a tela de
    [Arguments]    ${url}
    ${url_atual}    Get Location
    Wait Until Location Contains       ${url}
    Location Should Contain            ${url}
    Should Contain    ${url_atual}     ${url}

E clicar em Cadastrar
    Clicar no elemento    ${home_button_cadastrar}

E confirmar o modal clicando em ${acao}
    IF    ${acao} == 'Cadastrar'
        Clicar no elemento    ${home_button_modal_cadastrar}
    ELSE IF    ${acao} == 'Alterar'
        Clicar no elemento    ${home_button_modal_alterar}
    ELSE IF    ${acao} == 'Deletar'
        Clicar no elemento    ${home_button_modal_deletar}
    ELSE IF    ${acao} == 'Ativar'
        Clicar no elemento    ${home_button_modal_ativar}
    ELSE IF    ${acao} == 'Sim'
        Clicar no elemento    ${home_button_modal_sim}
        ELSE IF    ${acao} == 'Não'
        Clicar no elemento    ${home_button_modal_não}
    END


Então o sistema exibe um alerta de
    [Arguments]    ${alerta}
    Wait Until Element Is Visible    ${home_mensagem_alerta}
    Wait Until Element Is Enabled    ${home_mensagem_alerta}
    Element Should Be Visible    ${home_mensagem_alerta}
    ${texto}    Get Text    ${home_mensagem_alerta}
    Should Contain    ${texto}    ${alerta}

E clicar em Voltar
    Scroll Element Into View    ${home_button_voltar}
    Sleep    1s
    Clicar no elemento    ${home_button_voltar}

E clicar em Alterar
    Clicar no elemento    ${home_button_alterar}

