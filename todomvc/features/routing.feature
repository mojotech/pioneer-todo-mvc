Feature: Routing

  Background:
    Given I visit TODOMVC
    And I make sure that there are no todos
    Then I add three todos to the list
    And I complete two todos

  Scenario: Click on Active link
    When I click on the active link
    Then I should be on the active page

  Scenario: Click on Completed link
    When I click on the completed link
    Then I should be on the completed page

  Scenario: Click on All Link
    When I click on the completed link
    Then I click on the all link
    Then I should be on the home page
  @wow
  Scenario: I visit #/completed
    When I click on the completed link
    Then only completed todos are shown
  @doge
  Scenario: I visit #/active
    When I click on the active link
    Then only active todos are shown

  Scenario: Visiting #/ after #/completed
    When I click on the completed link
    Then I click on the all link
    Then I should see all todos
