@frontoffice
Feature: Showing exemptions lists using continue button instead of tab
  As a waste holder
  I want to easily choose waste exemption activites from the list
  So that I can easily complete my registration

Scenario: Using continue button navigates through exemption activity lists
    Given I am on the choose exemptions page
     When I click continue
     Then I will be shown the first exemptions list

@wip
Scenario: Using continue button navigates through exemption activity lists
    Given I am on the choose exemptions page
     When I click continue through the tabs without choosing an exemption
     Then I will be shown a message prompting me to choose an exemption
