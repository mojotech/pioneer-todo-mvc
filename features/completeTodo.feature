Feature: Add Todo
  Background:
    Given I view todomvc
    And I add a todo "eat apple jacks"
    And I add a todo "sing la la"
    And I add a todo "eating my foo bar"
    And I complete the "0" todo

  Scenario: I complete a todo
    Given I should see "3" todos
    Then I should see "2 items left" in the footer

  Scenario: I complete a todo and filter by completed
    When I click on the completed link
    Then I should see "1" todos
    And I should see "2 items left" in the footer

  Scenario: I complete a todo and filter by active
    When I click on the active link
    Then I should see "2" todos
    And I should see "2 items left" in the footer
