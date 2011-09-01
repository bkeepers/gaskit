@javascript
Feature: Assigning stories to users

  Scenario: Assigning an existing story to a user
    Given the following user exists:
      | name            | email                 |
      | Chuck Bartowski | charles@bartowski.com |
    Given the following story exists:
      | description                     |
      | Story can be assigned to a user |
      | Not assigned to me              |
    When I go to the home page
    And I follow "Story can be assigned to a user"
    And I select "Chuck Bartowski" from "Owned by" within the story editor
    And I press "Save" within the story editor
    Then I should see "CB" within the story "Story can be assigned to a user"

  Scenario: Assigning a new story to a user
  Scenario: Starting an unassigned story assigns it
  Scenario: Starting an assigned story does not assign it
