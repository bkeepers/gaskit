@javascript
Feature: Stories

  Scenario: Adding a story
    When I go to the home page
    And I follow "New Story"
    And I fill in "description" with "Set up integration tests with capybara-webkit"
    And I press "Save"
    Then I should see "Set up integration tests"

    When I go to the home page
    Then I should see "Set up integration tests"

  Scenario: Adding a bug
    When I go to the home page
    And I follow "New Story"
    And I choose "Bug" within the story editor
    And I fill in "description" with "Sometimes stuff blows up" within the story editor
    And I press "Save" within the story editor
    Then I should see "Sometimes stuff blows up"

    When I go to the home page
    And I follow "Sometimes stuff blows up"
    And the "type" radio should be "bug" within the story editor

  Scenario: Updating a story
    Given the following story exists:
      | description      |
      | Updating a story |
    When I go to the home page
    And I follow "Updating a story"
    Then the "description" field should contain "Updating a story" within the story editor

    When I fill in "description" with "User can update a story" within the story editor
    And I select "Started" from "status" within the story editor
    And I choose "Bug" within the story editor
    And I press "Save" within the story editor

    Then I should see "User can update a story" within the story list
    And I should not see "Updating a story" within the story list

    When I go to the home page
    Then I should see "User can update a story"
    And I should not see "Updating a story"

    When I follow "User can update a story"
    Then the "type" radio should be "bug" within the story editor

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

  # not sure why this fails webkit
  @selenium
  Scenario: Changing status of a story
    Given the following story exists:
      | description        |
      | Get something done |
    When I go to the home page
    And I press "Start" within the story "Get something done"
    And I press "Finish" within the story "Get something done"
    And I press "Deliver" within the story "Get something done"
    And I press "Reject" within the story "Get something done"
    And I press "Restart" within the story "Get something done"
    And I press "Finish" within the story "Get something done"
    And I press "Deliver" within the story "Get something done"
    And I press "Approve" within the story "Get something done"

    And I follow "Get something done"
    Then the "status" field should contain "approved"
