@backoffice @edit 
Feature: Back office user edits a registration
  As an admin team user
  I need to edit a waste exemption registration
  So that I can keep it up to date

  Background: Register an exemption
    Given I have a valid registration
@smoke
  Scenario: [RUBY-62] Edit a registration's applicant details
    Given I sign in as an admin team user
     When I edit the applicants phone number
      And I complete the edit
     Then I can see the new details on the registration details page
      And I can see the change recorded on the change history page

  Scenario: [RUBY-62] Edit a registration's contact email
    Given I sign in as an admin team user
     When I edit the contact email address
      And I complete the edit
     Then I can see the new details on the registration details page
      And I can see the change recorded on the change history page

  Scenario: Edit a registration's site location
    Given I sign in as an admin team user
     When I edit the site location
      And I complete the edit
     Then I can see the updated location in the registration's sites list
      And I can see the change recorded on the change history page
      
  Scenario: Edit a registration's contact address
    Given I sign in as an admin team user
     When I edit the contact address
      And I complete the edit
     Then I can see the new details on the registration details page
      And I can see the change recorded on the change history page

  Scenario: Cancel registration
   Given I sign in as an admin team user
    When I edit the most recent registration
     And I cancel the edit
    Then I cannot see the new details on the registration details page
