@javascript
Feature: Stories

  Scenario: Adding a story
    When I go to the home page
    And I fill in "description" with "Set up integration tests with capybara-webkit"
    And I press "Add"
    Then I should see "Set up integration tests"

    When I go to the home page
    Then I should see "Set up integration tests"

  Scenario: Updating a story
    Given the following story exists:
      | description      |
      | Updating a story |
    When I go to the home page
    And I follow "Updating a story"
    Then the "description" field should contain "Updating a story" within the story editor

    When I fill in "description" with "User can update a story" within the story editor
    And I select "Started" from "status" within the story editor
    And I press "Update" within the story editor

    Then I should see "User can update a story" within the story list
    And I should not see "Updating a story" within the story list

    When I go to the home page
    Then I should see "User can update a story"
    And I should not see "Updating a story"

  Scenario: Deleting a story
    Given the following story exists:
      | description    |
      | A stupid story |
    When I go to the home page
    And I follow "A stupid story"
    And I follow "Delete" within the story editor
    Then I should not see "A stupid story"

    When I go to the home page
    Then I should not see "A stupid story"
