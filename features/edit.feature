Feature: Editing a Todo

  Background:
    Given I visit TODOMVC
    And I make sure that there are no todos
    And I enter a new todo
    And I activate edit mode

  Scenario: All other controls will be hidden
    When the toggle button will be hidden
    Then the destroy button will be hidden

  Scenario: An input will be brought forward containing the todo title
    Then an input will be brought forward

  Scenario: The input should be focused
    Then the input will be focused

  Scenario: The edit should be saved on enter
    When I fill the input with something
    And press enter
    Then it should be saved

  Scenario: The edit should be saved on blur
    When I fill the input with something
    And click elsewhere
    Then it should be saved

  Scenario: The editing class should be removed on save
    When I fill the input with something
    And press enter
    Then the editing class should be removed from parent li

  Scenario: An edit should be trimmed
    When I fill the input with something untrimmed
    And press enter
    Then it should be trimmed upon save

  Scenario: An empty edited todo should be destroyed
    When delete the text from the input
    And press enter
    Then it should be removed

  Scenario: Changes should be discarded if escape is pressed
    And I fill the input with something
    And press escape
    Then it should be unchanged

  Scenario: Edit mode should be left if escape is pressed
    And I fill the input with something
    And press escape
    Then the editing class should be removed from parent li
