Feature: Atualiza os dados de um usuario cadastrado
Como uma pessoa qualquer
Desejo atualizar as informacoes de determinado usuario
Para ter o registro de suas informacoes atualizadas

    Scenario: Atualizar usuario cadastrado
        * def emailUsuario = Date.now().toString() + "@exemple.com"
        * def nomeUsuario = "Soldado" + Date.now().toString()
        * def payload = read("payloadCriacaoUsuario.json")
        Given url baseUrl + "/users"
        And request payload
        When method post
        Then status 201

        * def userId = response.id
        * print userId
        * def emailUsuario = Date.now().toString() + "@new.com"
        * def nomeUsuario = "SoldadoNovo" + Date.now().toString()
        * def payload = read("payloadCriacaoUsuario.json")
        Given url baseUrl + "/users"
        And path userId
        And request payload
        When method put
        Then status 200
        And match response == "#object"
        And match response contains { name: "#(nomeUsuario)", email: "#(emailUsuario)", id: "#(userId)"}