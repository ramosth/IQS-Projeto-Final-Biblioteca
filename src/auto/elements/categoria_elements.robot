*** Settings ***
Documentation    Elementos referente a tela de Categoria

*** Variables ***

${categoria_titulo_cadastrar}                       //span[.='Cadastrar Categoria']
${categoria_titulo_buscar}                          //span[.='Buscar Categoria']
${categoria_input_nome}                             //input[@id='nomeCategoria']
${categoria_select_dominio}                         //select[@id='nomeCategoria']
${categoria_select_dominio_selecionado}             //select[@id='dominioSelecionado']
${categoria_alerta_cadastro_erro}                   No value present
${categoria_alerta_cadastro_sucesso}                Categoria cadastrada com sucesso.
${categoria_alerta_alteracao_sucesso}               Categoria alterada com sucesso.
${categoria_alerta_exclusao_sucesso}                Categoria inativada com sucesso.
${categoria_alerta_ativada_sucesso}                 Categoria ativada com sucesso.
${categoria_button_inativas}                        //button[.='Inativas']
