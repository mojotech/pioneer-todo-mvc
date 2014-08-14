Feature: No Todos

  Background:
    Given I visit TODOMVC
    When I make sure that there are no todos

  Scenario: ID main should be hidden
    Then Main should be hidden

  Scenario: ID footer should be hidden
    Then Footer should be hidden
