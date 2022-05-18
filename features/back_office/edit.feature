@backoffice @edit 
Feature: Back office user edits a registration
  As an super admin agent
  I need to edit a waste exemption registration
  So that I can keep it up to date

  Background: Register an exemption
    Given my business is an "individual"
     When I register an exemption
     Then I will be informed the registration is complete
@smoke
  Scenario: [RUBY-62] Edit a registration
    Given I sign in as a super agent
     When I edit the most recent registration
      And I complete the edit
     Then I can see the new details on the registration details page

  Scenario: Cancel registration
   Given I sign in as a super agent
    When I edit the most recent registration
     And I cancel the edit
    Then I cannot see the new details on the registration details page
