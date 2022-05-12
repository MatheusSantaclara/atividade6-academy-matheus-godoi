Feature: Criar um novo usuario
Como uma pessoa qualquer
Desejo registrar informacoes de usuario
Para poder manipular estas informacoes livremente

    Scenario: Criar usuario
        * def emailUsuario = Date.now().toString() + "@exemple.com"
        * def nomeUsuario = "Soldado" + Date.now().toString()
        * def payload = read("payloadCriacaoUsuario.json")
        Given url baseUrl + "/users"
        And request payload
        When method post
        Then status 201
        And match response == "#object"
        And match response contains { name: "#(nomeUsuario)", email: "#(emailUsuario)"}