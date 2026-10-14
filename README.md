# 📚 Automação de Testes: Sistema de Biblioteca

![Robot Framework](https://img.shields.io/badge/Robot%20Framework-6.1-000000?style=flat-square&logo=robotframework&logoColor=white)
![Selenium](https://img.shields.io/badge/SeleniumLibrary-6.1-43B02A?style=flat-square&logo=selenium&logoColor=white)
![Python](https://img.shields.io/badge/Python-3.9-3776AB?style=flat-square&logo=python&logoColor=white)
![Status](https://img.shields.io/badge/status-concluído-success?style=flat-square)

Projeto final do curso **Introdução à Qualidade de Software (IQS)** da FEST/UFF em parceria com a T2M (2024.1).

O objetivo foi automatizar os testes de front-end de um sistema de biblioteca, a partir dos casos de teste mapeados para os requisitos do backlog. O projeto cobre todo o ciclo: **mapeamento dos casos → automação → execução → evidências**.

## O que é testado

São **33 cenários automatizados**, escritos em estilo **BDD (Dado / Quando / Então)** e organizados por módulo:

| Módulo | Cadastro | Busca, edição e exclusão |
|---|:---:|:---:|
| Domínio | ✅ | ✅ |
| Categoria | ✅ | ✅ |
| Conhecimento | ✅ | ✅ |

Os testes incluem caminhos felizes, validações de campos obrigatórios, paginação, ativação de itens inativos, navegação (voltar) e logout com confirmação.

Exemplo de cenário:

```robotframework
Cenário: CT01 - Cadastrar categoria como Gestor
    Dado que usuário realize login     ${LOGIN_GESTOR.USER_2.EMAIL}    ${LOGIN_GESTOR.USER_2.SENHA}
    E esteja na tela inicial do sistema
    Quando acessar a tela de cadastro de categoria
    E preencher o campo Nome
    E selecionar um domínio
    E clicar em Cadastrar
    Então o sistema exibe um alerta de    alerta=${categoria_alerta_cadastro_sucesso}
    E categoria cadastrada é exibida na listagem geral
```

## Arquitetura

O projeto usa o padrão **Page Object**: cada página do sistema tem seus elementos e suas ações separados. Isso deixa os testes mais legíveis e a manutenção mais simples, porque uma mudança na tela é ajustada em um único lugar.

```
src/
├── auto/
│   ├── data/        # massa de dados e configurações (YAML)
│   ├── elements/    # localizadores de cada página
│   └── keywords/    # ações e validações de cada página
└── config/
    ├── hooks.robot     # setup/teardown (login, evidências)
    └── package.robot   # importações centralizadas
tests/
├── categoria/
├── conhecimento/
└── dominio/
```

**Evidências:** ao final de cada teste é gerado um screenshot, salvo em uma pasta com o nome da funcionalidade e a data da execução. Os relatórios do Robot (`log.html` e `report.html`) ficam na pasta `log/`.

## Como executar

**Pré-requisitos:** Python 3.9+ e Google Chrome.

```bash
# 1. Crie e ative o ambiente virtual
python -m venv .venv
.venv\Scripts\activate          # Windows (CMD)
# .venv\Scripts\Activate.ps1    # Windows (PowerShell)
# source .venv/bin/activate     # Linux/macOS

# 2. Instale as dependências
pip install -r requirements.txt

# 3. Rode todos os testes
robot -d log tests

# ou apenas um módulo
robot -d log tests/categoria
```

> ⚠️ O sistema de biblioteca era um ambiente disponibilizado pelo curso, então ele pode não estar mais no ar.

## Tecnologias

- [Robot Framework](https://robotframework.org/) 6.1.1
- [SeleniumLibrary](https://github.com/robotframework/SeleniumLibrary) 6.1.2
- [FakerLibrary](https://github.com/guykisel/robotframework-faker) para geração de dados

---

Desenvolvido por [Thamires Ramos](https://github.com/ramosth) · [LinkedIn](https://linkedin.com/in/thamires-ramos/)
