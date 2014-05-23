Feature: Add Todo
  Background:
    Given I view todomvc

  Scenario: I complete a todo
    When I add a todo "eat apple jacks"
    When I add a todo "sing la la"
    When I add a todo "eating my foo bar"
    When I complete the "0" todo
    Then I should see "3" todos
    Then I should see "2 items left" in the footer

  Scenario: I complete a todo and filter by completed
    When I add a todo "eat apple jacks"
    When I add a todo "sing la la"
    When I add a todo "eating my foo bar"
    When I complete the "0" todo
    When I click on the completed link
    Then I should see "1" todos
    Then I should see "2 items left" in the footer

  Scenario: I complete a todo and filter by active
    When I add a todo "eat apple jacks"
    When I add a todo "sing la la"
    When I add a todo "eating my foo bar"
    When I complete the "0" todo
    When I click on the active link
    Then I should see "2" todos
    Then I should see "2 items left" in the footer
