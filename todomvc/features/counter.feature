Feature: Todo Counter

  Background:
    Given I visit TODOMVC
    And I make sure that there are no todos

  Scenario: The number of active todos is displayed
    And I add three todos to the list
    Then I should see three active todos

  Scenario: The counter is wrapped in a strong tag
    And I add three todos to the list
    Then the number of todos should be wrapped in a strong tag

  Scenario: The word item is pluralized when there zero items
    And I enter a new todo
    And I complete that todo
    Then I should see zero items

  Scenario: The word item is not pluralized when there is one item
    And I enter a new todo
    Then I should see one item

  Scenario: The word item is pluralized when there are several items
    And I add three todos to the list
    Then I should see three items
