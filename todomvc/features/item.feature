Feature: Item interactions

  Background:
    Given I visit TODOMVC
    When I make sure that there are no todos

  Scenario: Clicking checkbox updates completed value
    When I enter a new todo
    When I click completed on the first todo
    Then its complete value should be checked

  Scenario: Clicking checkbock updates class completed on parent li
    When I enter a new todo
    When I click completed on the first todo
    Then its parent li should have class completed

  Scenario: Double clicking label activated editing mode
    When I enter a new todo
    Then I double click it
    Then the todo should be in editing mode

  Scenario: Hovering over todo shows remove button
    When I enter a new todo
    And I hover over it
    Then I should be able to see the remove button
