Feature: Deleta um usuario cadastrado
Como uma pessoa qualquer
Desejo remover um usuario
Para que suas infoemacoes nao estejam mais registradas

    Scenario: Deleta usuario
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
        When method delete
        Then status 204