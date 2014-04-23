Feature: My First Feature
  Background:
    Given I am a human

  Scenario: I see a duck
    When I look up a duck
    Then I should see "11" ducks
