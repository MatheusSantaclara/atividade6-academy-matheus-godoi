Feature: Buscar usuario por nome/email
Como uma pessoa qualquer
Desejo pesquisar usuario por nome ou e-mail
Para ser capaz de encontrar um usuario cadastrado facilmente
    Scenario: Buscar usuario pelo nome
        * def emailUsuario = Date.now().toString() + "@exemple.com"
        * def nomeUsuario = "Soldado" + Date.now().toString()
        * def payload = read("payloadCriacaoUsuario.json")
        Given url baseUrl + "/users"
        And request payload
        When method post
        Then status 201

        * def userName = response.name
        * def userEmail = response.email
        Given url baseUrl + "/search"
        And param value = userName
        And param value = userEmail
        When method get
        Then status 200