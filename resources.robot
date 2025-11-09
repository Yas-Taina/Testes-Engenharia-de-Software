*** Settings ***
Documentation    Resources dos testes do Spotify
Library    SeleniumLibrary
Library    DateTime
Library    String
Library    XML

*** Variables ***
${LOGIN}    engenhariadesoftwareteste@gmail.com
${LOGIN_INCORRETO}    engenhariadetestesoftware@gmail.com
${SENHA}    teste654321
${SENHA_INCORRETA}    654321teste
${URL}    https://open.spotify.com/intl-pt
${BROWSER}    chrome
${BOTÃO_HOME}    //button[@data-testid='home-button']
${BOTÃO_LOGIN}    //button[@data-testid='login-button']
${BOTÃO_LOGIN_SENHA}    //button[text()='Entrar com senha']
${TEXTO_LOGIN_SENHA}    //h1[@data-encore-id='text' and text()='Entrar com senha']
${TEXTO_PAG_LOGIN}    //h1[@data-encore-id='text' and text()='Olá de novo']
${CAMPO_BUSCA}    //input[@data-testid='search-input']
${TEXTO_PESQUISA_ARTISTA}    Eminem
${TEXTO_PESQUISA_MUSICA}   Summertime Sadness

*** Keywords ***
Abrir browser
    Open Browser    browser=${BROWSER}
    Maximize Browser Window

Fechar browser
    Capture Page Screenshot
    Close Browser

Abrir página de Login
    Go To    ${URL}
    Wait Until Element Is Visible    ${BOTÃO_LOGIN}
    Click Button    ${BOTÃO_LOGIN}
    Wait Until Element Is Visible    ${TEXTO_PAG_LOGIN}

Inserir Email Correto
    Input Text    username    ${LOGIN}
    Click Button    ${BOTÃO_LOGIN}

Inserir Email Incorreto
    Input Text    username    ${LOGIN_INCORRETO}
    Click Button    ${BOTÃO_LOGIN}

Selecionar Login com Senha
    Wait Until Element Is Visible    ${BOTÃO_LOGIN_SENHA}
    Click Button   ${BOTÃO_LOGIN_SENHA}
    Wait Until Element Is Visible    ${TEXTO_LOGIN_SENHA}

Inserir Senha Correta
    Selecionar Login com Senha
    Input Password    password    ${SENHA}
    Click Button    ${BOTÃO_LOGIN}

Inserir Senha Incorreta
    Selecionar Login com Senha
    Input Password    password    ${SENHA_INCORRETA}
    Click Button    ${BOTÃO_LOGIN}

O usuário deve ser redirecionado para a pagina inicial de sua conta
    Wait Until Element Is Visible    ${BOTÃO_HOME}

A mensagem de erro de email deve ser exibida
    Wait Until Element Is Visible    //div[@id="username-error"]

A mensagem de erro de senha deve ser exibida
    Wait Until Element Is Visible    //span[text()='Nome de usuário ou senha incorretos.']

Logar no sistema
    Abrir página de Login
    Inserir Email Correto
    Inserir Senha Correta

Deslogar do sistema
    Wait Until Element Is Visible    ${BOTÃO_HOME}
    Click Button    //button[@data-testid='user-widget-link']
    Click Button    //button[@data-testid='user-widget-dropdown-logout']

O usuário deve ser direcionado para a página inicial, sem acesso à conta
    Wait Until Element Is Visible    ${BOTÃO_LOGIN}

Inserir Nome do Artista para Busca
    Wait Until Element Is Visible    ${CAMPO_BUSCA}
    Input Text    ${CAMPO_BUSCA}    ${TEXTO_PESQUISA_ARTISTA}

Buscar Artista
    Press Keys    ${CAMPO_BUSCA}    ENTER
    Wait Until Element Is Visible    //span[text()='Artistas']
    Click Element    //span[text()='Artistas']

O artista deve aparecer nos resultados
    Wait Until Page Contains Element    //p[@title='${TEXTO_PESQUISA_ARTISTA}']
    Element Text Should Be    //p[@title='${TEXTO_PESQUISA_ARTISTA}']    ${TEXTO_PESQUISA_ARTISTA}

Inserir Nome da Música para Busca
    Wait Until Element Is Visible    ${CAMPO_BUSCA}
    Input Text    ${CAMPO_BUSCA}    ${TEXTO_PESQUISA_MUSICA}

Buscar Música
    Press Keys    ${CAMPO_BUSCA}    ENTER
    Wait Until Element Is Visible    //span[text()='Músicas']
    Click Element    //span[text()='Músicas']

A música deve aparecer nos resultados
    Wait Until Page Contains Element    //div[@data-encore-id='text' and text()='${TEXTO_PESQUISA_MUSICA}']
    Page Should Contain Element    //div[@data-encore-id='text' and text()='${TEXTO_PESQUISA_MUSICA}']


