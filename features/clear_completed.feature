Feature: Clear Completed Button

  Background:
    Given I visit TODOMVC
    And I make sure that there are no todos

  Scenario: Displays the number of completed todos
    Then I add three todos to the list
    And I complete two todos
    And I should see two completed todos on the button

  Scenario: When clicked removes completed todos
    Then I add three todos to the list
    And I complete one todo
    And I click clear completed
    And the completed todo should be removed

  Scenario: Hidden when there are no completed todos
    Then I add three todos to the list
    And the clear completed button should be hidden
