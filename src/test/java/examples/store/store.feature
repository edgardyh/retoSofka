Feature: sample karate test script

  Background:
    * url 'https://petstore.swagger.io/v2/store'

  @GetUserById
  Scenario: get any order buy
    * def getRandomValue = function() {return Math.floor((10) + 1 * Math.random());}
    * def id = getRandomValue()
    Given path '/order/'+ id
    When method get
    Then status 200
    * match response contains {"id":"#number","petId":"#number","quantity":"#number","shipDate":"#string","status":"#string","complete":"#boolean"}

  @ReadNewOrderCreated
  Scenario: make a order and verify it
    Given path '/order/'
    And request
    """
    {
    "id": 11,
    "petId": 0,
    "quantity": 0,
    "shipDate": "2024-05-20T12:42:20.050Z",
    "status": "placed",
    "complete": true
    }
    """
    When method post
    Then status 200
    * match response contains {"id":11,"petId":0,"quantity":0,"shipDate":"#string","status":"#string","complete":"#boolean"}
    * call read("../store/store_snippets.feature@CleanOrder")

  @ValidateInventory
    Scenario: Read the inventory
    Given path '/inventory'
    When method get
    Then status 200
    * match response != null




