Feature: Todo MVC
  Background:
    Given I view todomvc
    And I add a todo "eat apple jacks"
    And I add a todo "sing la la"

  Scenario: I add 2 todos
    Given I should see "2" todos
    Then I should see "2 items left" in the footer

  Scenario: I filter by completed
    When I click on the completed link
    Then I should see "0" todos
    And I should see "2 items left" in the footer

  Scenario: I filter by active
    When I click on the active link
    Then I should see "2" todos
    And I should see "2 items left" in the footer
