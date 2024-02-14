*** Settings ***
Documentation    Elementos referente a tela de Conhecimento

*** Variables ***

${conhecimento_titulo_cadastrar}                       //span[.='Cadastrar Conhecimento']
${conhecimento_titulo_buscar}                          //span[.='Buscar Conhecimento']
${conhecimento_input_titulo}                           //input[@placeholder='Título do conhecimento']
${conhecimento_input_introducao}                       //label[contains(.,'Introdução: *')]/following-sibling::textarea
${conhecimento_select_categoria}                       //select[@id='dataConhecimento']
${conhecimento_input_colaborador}                      //input[@placeholder='Nome do colaborador']
${conhecimento_input_titulo_video}                     //label[contains(.,'Título da foto / vídeo: *')]/following-sibling::input[@placeholder='Título da mídia']
${conhecimento_input_foto_video}                      //label[contains(.,'Foto / Vídeo: *')]/following-sibling::input
${conhecimento_input_descricao}                        //label[contains(.,'Descrição: *')]/following-sibling::textarea
## ${conhecimento_select_categoria_selecionado}           //select[@id='categoriaSelecionada']
${conhecimento_alerta_cadastro_erro}                   No value present
${conhecimento_alerta_cadastro_sucesso}                Conhecimento cadastrado com sucesso.
${conhecimento_alerta_alteracao_sucesso}               Conhecimento alterado com sucesso.
${conhecimento_alerta_exclusao_sucesso}                Conhecimento inativado com sucesso.
${conhecimento_alerta_ativada_sucesso}                 Conhecimento ativado com sucesso.
${conhecimento_alerta_titulo_repetido}                 Já existe um titulo com este nome!
${conhecimento_button_inativas}                        //button[.='Inativos']
