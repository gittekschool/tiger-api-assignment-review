#Author: Mohammad Shokriyan
@Smoke
Feature: Authentication Smoke Test

  Scenario: Generate token with Valid username and password
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"
    And request
      """
       {
       "username": "supervisor", 
       "password": "tek_supervisor"
       }
      """
    When method post
    Then status 200
    And print response.token

  Scenario: Generate token with invalid username and valid password
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"
    And request
      """
         {
         "username": "supervisor-admin", 
         "password": "tek_supervisor"
         }
      """
    When method post
    Then status 404
    And assert response.errorMessage == "USER_NOT_FOUND"
