Feature: Listar usuarios
Como uma pessoa qualquer
Desejo consultar todos os usuarios cadastrados
Para ter as informacoes de todos os usuarios

    Scenario: Listar todos os usuarios
        Given url baseUrl + "/users"
        When method get
        Then status 200
        And match response == "#array"