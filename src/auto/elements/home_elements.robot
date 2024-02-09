*** Settings ***
Documentation    Elementos referente a tela Inicial do sistema

*** Variables ***

${home_saudacao}                      //div[@class='row']/div/div/span
${home_button_logout}                 //span[text()='Sair']
${home_button_sistema_biblioteca}     //button[.='SBSistema de Biblioteca']
${home_button_dominio}                //button[.='Domínio']
${home_button_categoria}              //button[.='Categoria']
${home_button_conhecimento}           //button[.='Conhecimento']
${home_button_cadastrar_categ}        //button[.='Cadastrar Categoria']
${home_button_buscar_categ}           //button[.='Buscar Categoria']
${home_button_cadastrar_dominio}      //button[.='Cadastrar Domínio']
${home_button_buscar_dominio}         //button[.='Buscar Domínio']
${home_button_cadastrar_conhecim}     //button[.='Cadastrar Conhecimento']
${home_button_buscar_conhecim}        //button[.='Buscar Conhecimento']
${home_button_voltar}                 //button[.='Voltar']
${home_button_cadastrar}              //button[.='Cadastrar']
${home_button_alterar}                //button[.='Alterar']
${home_button_deletar}                //button[.='Deletar']
${home_button_modal_cadastrar}        //div[@class='modal-footer']/div/button[.='Cadastrar']
${home_button_modal_alterar}          //div[@class='modal-footer']/div/button[.='Alterar']
${home_button_modal_deletar}          //div[@class='modal-footer']/div/button[.='Deletar']
${home_button_modal_ativar}           //div[@class='modal-footer']/div/button[.='Ativar']
${home_button_modal_cancelar}         //div[@class='modal-footer']/div/button[.='Cancelar']
${home_button_modal_fechar}           //button[@class='btn-close']
${home_button_modal_não}              //button[contains(.,'Não')]
${home_button_modal_sim}              //button[contains(.,'Sim')]
${home_mensagem_alerta}               //div[@class='Toastify']//div[@role='alert']/div[2]
${home_mensagem_campo_obrigatorio}    Preenchimento obrigatório do campo

## Tabela

${common_modal_titulo}                           //div[@class='modal-title h4']
${common_modal_texto}                            //div[@class='text-center modal-body']
${common_input_buscar}                           //input[@class='form-control']
${common_tabela_buscar}                          //table[@class='table table-striped table-hover']
${common_tabela_select_quant_itens}              //select[@class='select-per-page form-select']
${common_tabela_paginacao_proximo}               //div[@class='area-paginacao']/div[4]
${common_tabela_paginacao_anterior}              //div[@class='area-paginacao']/div[2]
${common_tabela_paginacao_ultimo}                //div[@class='area-paginacao']/div[5]
${common_tabela_paginacao_primeiro}              //div[@class='area-paginacao']/div[1]
${common_tabela_paginacao_texto}                 //div[@class='area-paginacao']/div[3]/span
${common_tabela_total_registros}                 //span[contains(text(),'Total de registros')]
${common_alerta_campo_nome_obrigatorio}          //div[@class='invalid-feedback']