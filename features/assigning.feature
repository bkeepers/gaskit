@javascript
Feature: Assigning stories to users

  Scenario: Assigning an existing story to a user
    Given the following user exists:
      | name            | email                 |
      | Chuck Bartowski | charles@bartowski.com |
    Given the following story exists:
      | description                     |
      | Story can be assigned to a user |
    When I go to the home page
    And I follow "Story can be assigned to a user"
    And I select "Chuck Bartowski" from "Owned by" within the story editor
    And I press "Save" within the story editor
    Then I should see "CB" within the story "Story can be assigned to a user"

  Scenario: Assigning a new story to a user

  Scenario: Starting an unassigned story assigns it
    Given I am "John Casey"
    Given the following story exists:
      | description |
      | Kill Morgan |
    When I go to the home page
    And I press "Start" within the story "Kill Morgan"
    Then I should see "JC" within the story "Kill Morgan"

  Scenario: Starting an assigned story does not assign it
    Given I am "Lester Pate"
    And the following user exists:
      | name        | email              |
      | Jeff Barnes | jeffrey@buymore.com |
    And the following story exists:
      | description | owner_email         |
      | Act creepy  | jeffrey@buymore.com |
    When I go to the home page
    And I press "Start" within the story "Act creepy"
    Then I should see "JB" within the story "Act creepy"
    And I should not see "LP" within the story "Act creepy"
