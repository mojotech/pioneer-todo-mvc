Feature: Clear Completed Button

  Background:
    Given I visit TODOMVC

  Scenario: Displays the number of completed todos
    When I add three todos to the list
    And I complete two todos
    Then I should see two completed todos on the button

  Scenario: When clicked removes completed todos
    When I add three todos to the list
    And I complete one todo
    Then I click clear completed
    Then the completed todo should be removed

  Scenario: Hidden when there are no completed todos
    When I add three todos to the list
    Then the clear completed button should be hidden
