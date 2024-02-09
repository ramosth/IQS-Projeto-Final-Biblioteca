*** Settings ***
Documentation       Arquivo de Mapeamento de Arquivos

Library             SeleniumLibrary
Library             FakerLibrary    locale=pt_BR
Library             DateTime
Library             String
Library             DebugLibrary
Library             BuiltIn
Library             OperatingSystem
Library             Collections
### Data ###
Variables           ../auto/data/login_page_data.yaml
Variables           ../auto/data/setup.yaml
### Elements ###
Resource            ../auto/elements/login_elements.robot
Resource            ../auto/elements/home_elements.robot
Resource            ../auto/elements/categoria_elements.robot
Resource            ../auto/elements/dominio_elements.robot
Resource            ../auto/elements/conhecimento_elements.robot

### Keyworks ###
Resource            ../auto/keywords/categoria_keywords.robot
Resource            ../auto/keywords/conhecimento_keywords.robot
Resource            ../auto/keywords/dominio_keywords.robot
Resource            ../auto/keywords/home_keywords.robot
Resource            ../auto/keywords/login_keywords.robot

### Config-Framework ###
Resource            hooks.robot