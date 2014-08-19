Feature: Mark all as Complete

  Background:
    Given I visit TODOMVC
    And I make sure that there are no todos
    When I add three todos to the list

  Scenario: Checkbox toggles all todos to the same state as itself
    When I complete one todo
    When I click the toggle all button
    Then all todos should be the same state as the toggle button

  Scenario: When all todo items are checked it should get checked
    Then the toggle-all button should not be checked
    When I complete all todos
    Then the toggle-all button should be checked

  Scenario: When all the todo items are checked and cleared
    When I complete two todos
    And I click clear completed
    Then the toggle-all button should not be checked
