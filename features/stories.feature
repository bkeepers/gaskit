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
    And I follow "Edit" within the story "Updating a story"
    And I fill in "description" with "User can update a story" within the story "Updating a story"
    And I select "Started" from "status" within the story "Updating a story"
    And I press "Update" within the story "Updating a story"

    Then I should see "User can update a story"
    And I should see "Started"
    And I should not see "Updating a story"

    When I go to the home page
    Then I should see "User can update a story"
    And I should not see "Updating a story"

  Scenario: Deleting a story
    Given the following story exists:
      | description    |
      | A stupid story |
    When I go to the home page
    And I follow "Edit" within the story "A stupid story"
    And I follow "Delete" within the story "A stupid story"
    Then I should not see "A stupid story"

    When I go to the home page
    Then I should not see "A stupid story"
