@backoffice
Feature: Back office user edits a registration
  As an super admin agent
  I need to edit a waste exemption registration
  So that I can keep it up to date

  Background: Register an exemption
    Given I am a limited company
     When I register an exemption
     Then I will be informed the registration is complete

  Scenario: [RUBY-62] Edit a registration
    Given I sign in as a super agent
     When I edit the most recent registration
      And I complete the edit
     Then I can see the new details on the registration details page

  Scenario: Negative access test
     When I sign in as an admin agent
     Then I cannot edit the most recent registration

  Scenario: Cancel registration
   Given I sign in as a super agent
    When I edit the most recent registration
     And I cancel the edit
    Then I cannot see the new details on the registration details page
