Feature: Todo MVC
  Background:
    Given I view todomvc

  Scenario: I add a todo
    When I add a todo "eat apple jacks"
    Then I should "1" todos

