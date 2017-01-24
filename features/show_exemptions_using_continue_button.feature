@frontoffice
Feature: Showing exemptions lists using continue button instead of tab
  As a waste holder
  I want to easily choose waste exemption activites from the list
  But not miss an exemption because I click the continue button instead of the next tab
  So that the registration I complete is accurate
  And the choose exemptions page works as I expect

  Scenario: On first tab clicking continue takes me to the next tab
    Given I am on the choose exemptions page
     When I click continue
     Then I will be on the "Using waste" tab

  Scenario: Clicking continue without choosing an exemption displays an error
    Given I am on the choose exemptions page
     When I click continue through the tabs without choosing an exemption
     Then I will be shown a message prompting me to choose an exemption

  Scenario: Clicking continue on the last tab takes me to the next page
    Given I am on the choose exemptions page
     When I click continue on the last tab
     Then I will be on the "reviewing" page
