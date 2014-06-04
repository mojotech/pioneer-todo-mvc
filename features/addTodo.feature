Feature: Todo MVC
  Background:
    Given I view todomvc

  Scenario: I add 2 todos
    When I add a todo "eat apple jacks"
    When I add a todo "sing la la"
    Then I should see "2" todos
    Then I should see "2 items left" in the footer

  Scenario: I filter by completed
    When I add a todo "eat apple jacks"
    When I add a todo "sing la la"
    When I click on the completed link
    Then I should see "0" todos
    Then I should see "2 items left" in the footer

  Scenario: I filter by active
    When I add a todo "eat apple jacks"
    When I add a todo "sing la la"
    When I click on the active link
    Then I should see "2" todos
    Then I should see "2 items left" in the footer
