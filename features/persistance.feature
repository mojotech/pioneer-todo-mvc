Feature: Persistance
  Background:
    Given I visit TODOMVC
    And I make sure that there are no todos
    Then I add three todos to the list

  Scenario: Refresh page
    When I visit TODOMVC
    Then I should still see three todos

  Scenario: Saving state of todos
    When I complete one todo
    And I click on the completed link
    And I visit TODOMVC
    And I should still see three todos
    Then that todo should still be complete

  Scenario: Navigating off of the site
    When I visit Google
    And I visit TODOMVC
    Then I should still see three todos
