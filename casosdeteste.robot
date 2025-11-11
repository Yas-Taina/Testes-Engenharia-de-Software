*** Settings ***
Documentation    Verifica funcionamento de login e pesquisa no site do Spotify
Test Setup       Abrir browser
Test Teardown    Fechar browser
Resource         resources.robot

*** Test Cases ***
CT01: Realizar Login com Credenciais Corretas
    [Documentation]    Testa se o login no sistema funciona com as credenciais corrretas
    [Tags]  login acesso
    Abrir página de Login
    Inserir Email Correto
    Inserir Senha Correta
    O usuário deve ser redirecionado para a pagina inicial de sua conta
    Deslogar do sistema

CT02: Realizar Login com Senha Incorreta
    [Documentation]    Testa se a mensagem de erro é exibida de maneira correta quando uma senha incorreta é inserida
    [Tags]  login acesso senha
    Abrir página de Login
    Inserir Email Correto
    Inserir Senha Incorreta
    A mensagem de erro de senha deve ser exibida

CT03: Realizar Login com Email Incorreto
    [Documentation]    Testa se a mensagem de erro é exibida de maneira correta quando um email incorreto é inserido
    [Tags]  login acesso email
    Abrir página de Login
    Inserir Email Incorreto
    A mensagem de erro de email deve ser exibida

CT04: Deslogar
    [Documentation]    Verifica se a ação de deslogar é realizada corretamente 
    [Tags]    deslogar acesso
    Logar no sistema
    Deslogar do sistema
    O usuário deve ser direcionado para a página inicial, sem acesso à conta
CT05: Pesquisar por artista existente
    [Documentation]    Testa a busca atraves do filtro de artistas
    [Tags]  busca artista
    Logar no sistema
    Inserir Nome do Artista para Busca
    Buscar Artista
    O artista deve aparecer nos resultados
    Deslogar do sistema


CT06: Pesquisar por música existente
    [Documentation]    Testa a busca de músicas
    [Tags]  busca música
    Logar no sistema
    Inserir Nome da Música para Busca
    Buscar Música
    A música deve aparecer nos resultados
    Deslogar do sistema
