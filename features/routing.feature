Feature: Routing

  Background:
    Given I visit TODOMVC
    And I make sure that there are no todos
    Then I add three todos to the list
    And I complete two todos

  Scenario: Click on Active link
    When I click on the active link
    And I should be on the active page
    Then the active link should be active

  Scenario: Click on Completed link
    When I click on the completed link
    And I should be on the completed page
    Then the completed link should be active

  Scenario: Click on All Link
    When I click on the completed link
    And I click on the all link
    And I should be on the home page
    Then the all link should be active

  Scenario: Completed shows only completed todos
    When I click on the completed link
    Then only completed todos are shown

  Scenario: Active shows only active todos
    When I click on the active link
    Then only active todos are shown

  Scenario: The home page shows all todos
    When I click on the completed link
    And I click on the all link
    Then I should see all todos
