@javascript
Feature: Stories

  Scenario: Adding a story
    When I go to the home page
    And I fill in "description" with "Set up integration tests with capybara-webkit"
    And I press "Add"
    Then I should see "Set up integration tests"

    When I go to the home page
    Then I should see "Set up integration tests"
