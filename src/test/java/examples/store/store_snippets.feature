@ignore
Feature: reusable scenario for create book

  Background:
    * url 'https://petstore.swagger.io/v2/store'

  @CleanOrder
  Scenario: Read new order created
    Given path '/order/11'
    When method delete
    Then status 200