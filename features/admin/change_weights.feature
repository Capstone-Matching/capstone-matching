Feature: Change Weights Page
  As an admin user
  I want to check the "Change Weights Page"
  So that I can ensure that the feature weights are displayed correctly

  Background:
   Given the following score attributes exist:
    | feature_name | feature_weight | attribute_id |
    | Test1        | 0.5            | 1           |
    | Test2        | 0.25           | 2           |
    | Test3        | 0.25           | 3           |

  Scenario: Display Change Weights Page
    When I visit the change weights page
    Then I should see "Change Feature Weights"
    And I should see "Test1"
    And I should see "Test2"
    And I should see "Test3"
    And I should see percentage input fields
    And I should see a "Save Changes" button

  Scenario: Verify Pre-filled Feature Weights
    When I visit the change weights page
    Then I should see the following pre-filled feature weights
      | .5 |
      | .25  |
      | .25  |

  Scenario: Verify Feature Weight Change
    When I visit the change weights page
    And I fill in "50" for "Test1" at index 0
    And I fill in "20" for "Test2" at index 1
    And I fill in "30" for "Test3" at index 2
    And I press "Save Changes"
    Then I should see "Feature weights updated successfully."
    Then I should see "50"
    And I should see "20"
    And I should see "30"

    Scenario: Verify Feature Weight Change Bad Path
    When I visit the change weights page
    And I fill in "1000" for "Resume Weight" at index 0
    And I fill in "500" for "Student Preference Weight" at index 1
    And I fill in "500" for "Submit Time Weight" at index 2
    And I press "Save Changes"
    Then I should see "Weights do not add up to 100%, try again."

