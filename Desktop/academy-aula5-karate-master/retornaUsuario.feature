Feature: Retorna um usuario usando id
Como uma pessoa qualquer
Desejo consultar os dados de um usuario
Para visualizar as informacoes deste usuario

    Scenario: Buscar usuario por id
        * def emailUsuario = Date.now().toString() + "@exemple.com"
        * def nomeUsuario = "Soldado" + Date.now().toString()
        * def payload = read("payloadCriacaoUsuario.json")
        Given url baseUrl + "/users"
        And request payload
        When method post
        Then status 201

        * def userId = response.id
        * print userId
        Given url baseUrl + "/users"
        And path userId
        When method get
        Then status 200
        And match response == "#object"
