*** Settings ***
Documentation    Elementos referente a tela de Domínio

*** Variables ***

${dominio_titulo_cadastrar}             //span[.='Cadastrar Domínio']
${dominio_titulo_buscar}                //span[.='Buscar Domínio']
${dominio_input_nome}                   //input[@id='nomeDominio']
${dominio_alerta_cadastro_erro}         No value present
${dominio_alerta_cadastro_sucesso}      Domínio cadastrado com sucesso.
${dominio_alerta_alteracao_sucesso}     Domínio alterado com sucesso.
${dominio_alerta_exclusao_sucesso}      Domínio inativado com sucesso.
${dominio_alerta_ativada_sucesso}       Domínio ativado com sucesso.
${dominio_button_inativos}              //button[.='Inativos']
