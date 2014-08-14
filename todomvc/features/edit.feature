Feature: Editing a Todo

  Background:
    Given I visit TODOMVC
    And I add a new todo
    Then I activate edit mode

  Scenario: All other controls will be hidden

  Scenario: An input will be brought forward containing the todo title

  Scenario: The input should be focused

  Scenario: The edit should be saved on enter

  Scenario: The edit should be saved on blur

  Scenario: The editing class should be removed on save

  Scenario: An edit should be trimmed

  Scenario: An empty edited todo should be destroyed

  Scenario: Changes should be discarded if escape is pressed

  Scenario: Edit mode should be left if escape is pressed
