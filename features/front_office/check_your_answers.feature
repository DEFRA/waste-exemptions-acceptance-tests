@frontoffice @changes @charging
Feature: Check your answers changes

Background: Create registration and sign into back office
    Given I start a new waste exemption registration

Scenario: User can change contact name from check your answers page
    Given I confirm my waste activities are "not on" a farm
      And I enter my business details for a "limited_company"
      And I select waste activity "We use waste in building and construction"
      And I select exemption "U1" from the activities list
      And I confirm my waste exemption selections
      And I confirm my exemption is for a single site
      And I confirm the charge summary
      And I enter the registration details
      And I am on the check your answers page
     When I change the contact name previously entered
     Then I can see the contact name has been updated

Scenario: User can change operator name from check your answers page
    Given I confirm my waste activities are "not on" a farm
      And I enter my business details for a "partnership"
      And I select waste activity "We use waste in building and construction"
      And I select exemption "U1" from the activities list
      And I confirm my waste exemption selections
      And I confirm my exemption is for a single site
      And I confirm the charge summary
      And I enter the registration details
      And I am on the check your answers page
     When I change the operator name previously entered
     Then I can see the operator name has been updated

Scenario: A company can change companies house number from check your answers page
    Given I confirm my waste activities are "not on" a farm
      And I enter my business details for a "llp"
      And I select waste activity "We use waste in building and construction"
      And I select exemption "U1" from the activities list
      And I confirm my waste exemption selections
      And I confirm my exemption is for a single site
      And I confirm the charge summary
      And I enter the registration details
     When I am on the check your answers page
      And I change the companies house number
     Then I can see the company name has been updated

Scenario: User can change the contact's position from check your answers page
    Given I confirm my waste activities are "not on" a farm
      And I enter my business details for a "partnership"
      And I select waste activity "We use waste in building and construction"
      And I select exemption "U1" from the activities list
      And I confirm my waste exemption selections
      And I confirm my exemption is for a single site
      And I confirm the charge summary
      And I enter the registration details
     When I am on the check your answers page
      And I change the contact position previously entered
     Then I can see the contact position has been updated

Scenario: User can change the contact address from check your answers page
    Given I confirm my waste activities are "not on" a farm
      And I enter my business details for a "llp"
      And I select waste activity "We use waste in building and construction"
      And I select exemption "U1" from the activities list
      And I confirm my waste exemption selections
      And I confirm my exemption is for a single site
      And I confirm the charge summary
      And I enter the registration details
     When I am on the check your answers page
     When I change the contact address previously entered
     Then I can see the contact address has been updated

Scenario: User can change the contact email address from check your answers page
    Given I confirm my waste activities are "not on" a farm
      And I enter my business details for a "local_authority"
      And I select waste activity "We use waste in building and construction"
      And I select exemption "U1" from the activities list
      And I confirm my waste exemption selections
      And I confirm my exemption is for a single site
      And I confirm the charge summary
      And I enter the registration details
     When I am on the check your answers page
      And I change the contact email address previously entered
     Then I can see the contact email address has been updated

Scenario: User can change the contact phone number from check your answers page
    Given I confirm my waste activities are "not on" a farm
      And I enter my business details for a "limited_company"
      And I select waste activity "We use waste in building and construction"
      And I select exemption "U1" from the activities list
      And I confirm my waste exemption selections
      And I confirm my exemption is for a single site
      And I confirm the charge summary
      And I enter the registration details
     When I am on the check your answers page
      And I change the contact phone number previously entered
     Then I can see the contact phone number has been updated

Scenario: User can change their farming question answers from check your answers page
    Given I confirm my waste activities are "not on" a farm
      And I enter my business details for a "individual"
      And I select waste activity "We use waste in building and construction"
      And I select exemption "U1" from the activities list
      And I confirm my waste exemption selections
      And I confirm my exemption is for a single site
      And I confirm the charge summary
      And I enter the registration details
     When I am on the check your answers page
      And I change my farming question answers
     Then I can see the farming questions have been updated

Scenario: User can change their waste exemptions choices from the check your answers page
    Given I confirm my waste activities are "not on" a farm
      And I enter my business details for a "limited_company"
      And I select waste activity "We use waste in building and construction"
      And I select exemption "U1" from the activities list
      And I confirm my waste exemption selections
      And I confirm my exemption is for a single site
      And I confirm the charge summary
      And I enter the registration details
      And I am on the check your answers page
     When I choose to change my waste exemptions
      And I select waste activity "We use waste in manufacturing or for a specified purpose"
      And I select waste activity "We sort, blend and recover waste"
      And I select waste activity "We store waste"
      And I select exemption "U9 T12 S1" from the activities list
      And I confirm my waste exemption selections
      Then I can see the total charge is £704.00

Scenario: User can change their applicant details from the check your answers page
    Given I confirm my waste activities are "not on" a farm
      And I enter my business details for a "limited_company"
      And I select waste activity "We use waste in building and construction"
      And I select exemption "U1" from the activities list
      And I confirm my waste exemption selections
      And I confirm my exemption is for a single site
      And I confirm the charge summary
      And I enter the registration details
      And I am on the check your answers page
     When I change my applicant details
     Then I can see my applicant details have been updated

Scenario: User can change the business address from check your answers page
    Given I confirm my waste activities are "not on" a farm
      And I enter my business details for a "local_authority"
      And I select waste activity "We use waste in building and construction"
      And I select exemption "U1" from the activities list
      And I confirm my waste exemption selections
      And I confirm my exemption is for a single site
      And I confirm the charge summary
      And I enter the registration details
     When I am on the check your answers page
      And I change the business address
     Then I can see the business address has been updated

Scenario: User can change the site location from a grid reference to an address from check your answers page
    Given I confirm my waste activities are "not on" a farm
      And I enter my business details for a "local_authority"
      And I select waste activity "We use waste in building and construction"
      And I select exemption "U1" from the activities list
      And I confirm my waste exemption selections
      And I confirm my exemption is for a single site
      And I confirm the charge summary
      And I enter the registration details for site "TQ6465676136"
      And I am on the check your answers page
     When I change to a site address
     Then I can see the site address on the check your answers page

Scenario: User can partner details from check your answers page
    Given I confirm my waste activities are "not on" a farm
      And I enter my business details for a "partnership"
      And I select waste activity "We use waste in building and construction"
      And I select exemption "U1" from the activities list
      And I confirm my waste exemption selections
      And I confirm my exemption is for a single site
      And I confirm the charge summary
      And I enter the registration details
      And I am on the check your answers page
     When I add another partner
     Then I can see the partner added to the check your answers page