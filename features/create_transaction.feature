Feature: Add transaction

  In order to keep track of my money as a user
  I want to be able to add a transaction to my list of transactions

  Scenario: Create a new transaction
    Given I enter valid information into the new transaction form
    When I add the transaction
    Then the transaction should be saved in my transaction register