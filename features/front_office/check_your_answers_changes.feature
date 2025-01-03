@frontoffice @changes
Feature: Check your answers changes

Scenario: User can change contact name from check your answers page
    Given my business is a "limited_company"
      And I start a new waste exemption registration
      And I register choosing to reuse my business information previously entered
      And I am on the check your answers page
     When I change the contact name previously entered
     Then I can see the contact name has been updated

Scenario: User can change operator name from check your answers page
    Given my business is an "individual"
      And I start a new waste exemption registration
      And I register choosing to reuse my business information previously entered
      And I am on the check your answers page
     When I change the operator name previously entered
     Then I can see the operator name has been updated

Scenario: A company can not change operator name from check your answers page
    Given my business is a "limited_company"
      And I start a new waste exemption registration
      And I register choosing to reuse my business information previously entered
     When I am on the check your answers page
     Then I can not the change operator name

Scenario: User can change the contact's position from check your answers page
    Given my business is a "partnership"
      And I start a new waste exemption registration
      And I register choosing to reuse my business information previously entered
      And I am on the check your answers page
     When I change the contact position previously entered
     Then I can see the contact position has been updated

Scenario: User can change the contact address from check your answers page
    Given my business is a "llp"
      And I start a new waste exemption registration
      And I register choosing to reuse my business information previously entered
      And I am on the check your answers page
      When I change the contact address previously entered
      Then I can see the contact address has been updated

Scenario: User can change the contact email address from check your answers page
    Given my business is a "local_authority"
      And I start a new waste exemption registration
      And I register choosing to reuse my business information previously entered
      And I am on the check your answers page
     When I change the contact email address previously entered
     Then I can see the contact email address has been updated

Scenario: User can change the contact phone number from check your answers page
    Given my business is a "charity"
      And I start a new waste exemption registration
      And I register choosing to reuse my business information previously entered
      And I am on the check your answers page
     When I change the contact phone number previously entered
     Then I can see the contact phone number has been updated

Scenario: User can change their farming question answers from check your answers page
    Given my business is an "individual"
      And I start a new waste exemption registration
      And I register choosing to reuse my business information previously entered
      And I am on the check your answers page
     When I change my farming question answers
     Then I can see the farming questions have been updated

Scenario: User can change their waste exemptions choices from the check your answers page
    Given my business is a "limited_company"
      And I start a new waste exemption registration
      And I register choosing to reuse my business information previously entered
      And I am on the check your answers page
     When I choose to change my waste exemptions
     And I select exemptions "T9 T12" from the list
     Then I can see the waste exemptions chosen have been updated

Scenario: User can change their applicant details from the check your answers page
    Given my business is a "limited_company"
      And I start a new waste exemption registration
      And I register choosing to reuse my business information previously entered
      And I am on the check your answers page
     When I change my applicant details
     Then I can see my applicant details have been updated

Scenario: User can change the business address from check your answers page
    Given my business is a "local_authority"
      And I start a new waste exemption registration
      And I register choosing to reuse my business information previously entered
      And I am on the check your answers page
     When I change the business address
     Then I can see the business address has been updated

Scenario: User can change the site address from check your answers page
    Given my business is a "limited_company"
      And I start a new waste exemption registration
      And I register choosing to reuse my business information previously entered
      And I am on the check your answers page
     When I change the site address
     Then I can see the site address has been updated

Scenario: User can change the site location national grid reference from check your answers page
    Given my business is a "limited_company"
      And I start a new waste exemption registration
      And I register choosing different business and contact addresses and a site grid reference
      And I am on the check your answers page
     When I change the site national grid reference
     Then I can see the site location has been updated

Scenario: User can change the site location from a grid reference to an address from check your answers page
    Given my business is a "limited_company"
      And I start a new waste exemption registration
      And I register choosing different business and contact addresses and a site grid reference
      And I am on the check your answers page
     When I change to a site address
     Then I can see the site address on the check your answers page
  
Scenario: Limited company can change the business details from check your answers page
    Given my business is a "limited_company"
      And I start a new waste exemption registration
      And I register choosing to reuse my business information previously entered
      And I am on the check your answers page
     When I change my companies house number
      And I confirm my business details are correct
     Then my company details have been updated

Scenario: User can partner details from check your answers page
    Given my business is a "partnership"
      And I start a new waste exemption registration
      And I register choosing to reuse my business information previously entered
      And I am on the check your answers page
     When I add another partner
     Then I can see the partner added to the check your answers page

Scenario: Renew a registration from back office with exemption changes
      Given I have a valid registration
        And I sign in as an admin team user
       When I choose to renew a registration
        And I am on the check your answers page
        And I choose to change my waste exemptions
        And I select exemptions "T9 T12" from the list
       Then I can see the waste exemptions chosen have been updated

Scenario: User can change their applicant details from the renewal check your answers page
     Given I have a valid registration
       And I sign in as an admin team user
      When I choose to renew a registration
       And I am on the check your answers page
      When I change my applicant details
      Then I can see my applicant details have been updated

Scenario: User can change the contact address from the renewal check your answers page
    Given I have a valid registration
      And I sign in as an admin team user
     When I choose to renew a registration
      And I am on the check your answers page
     When I change the contact address previously entered
     Then I can see the contact address has been updated

Scenario: User can change the contact phone number from renewal check your answers page
    Given I have a valid registration
      And I sign in as an admin team user
     When I choose to renew a registration
      And I am on the check your answers page
     When I change the contact phone number previously entered
     Then I can see the contact phone number has been updated

Scenario: User can change contact name from renewal check your answers page
    Given I have a valid registration
      And I sign in as an admin team user
     When I choose to renew a registration
      And I am on the check your answers page
     When I change the contact name previously entered
     Then I can see the contact name has been updated

Scenario: User can change the contact email address from renewal check your answers page
    Given I have a valid registration
      And I sign in as an admin team user
     When I choose to renew a registration
      And I am on the check your answers page
     When I change the contact email address previously entered
     Then I can see the contact email address has been updated
     
Scenario: Renew a registration from back office changing contact's position from check your answers page
     Given I have a valid registration
       And I sign in as an admin team user
      When I choose to renew a registration
       And I am on the check your answers page
      When I change the contact position previously entered
      Then I can see the contact position has been updated

Scenario: User can change the business address from renewal check your answers page
    Given I have a valid registration
      And I sign in as an admin team user
     When I choose to renew a registration
      And I am on the check your answers page
     When I change the business address
     Then I can see the business address has been updated

@beta
Scenario: User can change contact name from check your answers page
    Given I am participating in the private beta
      And I confirm my waste activities are "not" on a farm
      And I enter my business details for a "limited_company"
     When I select waste activity "We use waste in building and construction"
      And I select exemption "U1" from the activities list
      And I confirm my waste exemption selections
      And I enter the registration details
      And I am on the check your answers page
     When I change the contact name previously entered
     Then I can see the contact name has been updated
@beta
Scenario: User can change operator name from check your answers page
    Given I am participating in the private beta
      And I confirm my waste activities are "not" on a farm
      And I enter my business details for a "partnership"
     When I select waste activity "We use waste in building and construction"
      And I select exemption "U1" from the activities list
      And I confirm my waste exemption selections
      And I enter the registration details
      And I am on the check your answers page
     When I change the operator name previously entered
     Then I can see the operator name has been updated
@beta
Scenario: A company can change companies house number from check your answers page
    Given I am participating in the private beta
      And I confirm my waste activities are "not" on a farm
      And I enter my business details for a "llp"
     When I select waste activity "We use waste in building and construction"
      And I select exemption "U1" from the activities list
      And I confirm my waste exemption selections
      And I enter the registration details
     When I am on the check your answers page
      And I change the companies house number
     Then I can see the company name has been updated
@beta
Scenario: User can change the contact's position from check your answers page
    Given I am participating in the private beta
      And I confirm my waste activities are "not" on a farm
      And I enter my business details for a "partnership"
     When I select waste activity "We use waste in building and construction"
      And I select exemption "U1" from the activities list
      And I confirm my waste exemption selections
      And I enter the registration details
     When I am on the check your answers page
     When I change the contact position previously entered
     Then I can see the contact position has been updated
@beta
Scenario: User can change the contact address from check your answers page
    Given I am participating in the private beta
      And I confirm my waste activities are "not" on a farm
      And I enter my business details for a "llp"
     When I select waste activity "We use waste in building and construction"
      And I select exemption "U1" from the activities list
      And I confirm my waste exemption selections
      And I enter the registration details
     When I am on the check your answers page
      When I change the contact address previously entered
      Then I can see the contact address has been updated
@beta
Scenario: User can change the contact email address from check your answers page
    Given I am participating in the private beta
      And I confirm my waste activities are "not" on a farm
      And I enter my business details for a "local_authority"
     When I select waste activity "We use waste in building and construction"
      And I select exemption "U1" from the activities list
      And I confirm my waste exemption selections
      And I enter the registration details
     When I am on the check your answers page
     When I change the contact email address previously entered
     Then I can see the contact email address has been updated
@beta
Scenario: User can change the contact phone number from check your answers page
    Given I am participating in the private beta
      And I confirm my waste activities are "not" on a farm
      And I enter my business details for a "charity"
     When I select waste activity "We use waste in building and construction"
      And I select exemption "U1" from the activities list
      And I confirm my waste exemption selections
      And I enter the registration details
     When I am on the check your answers page
     When I change the contact phone number previously entered
     Then I can see the contact phone number has been updated
@beta
Scenario: User can change their farming question answers from check your answers page
    Given I am participating in the private beta
      And I confirm my waste activities are "not" on a farm
      And I enter my business details for a "individual"
     When I select waste activity "We use waste in building and construction"
      And I select exemption "U1" from the activities list
      And I confirm my waste exemption selections
      And I enter the registration details
     When I am on the check your answers page
     When I change my farming question answers
     Then I can see the farming questions have been updated
@beta
Scenario: User can change their waste exemptions choices from the check your answers page
    Given I am participating in the private beta
      And I confirm my waste activities are "not" on a farm
      And I enter my business details for a "limited_company"
      And I select waste activity "We use waste in building and construction"
      And I select exemption "U1" from the activities list
      And I confirm my waste exemption selections
      And I enter the registration details
      And I am on the check your answers page
     When I choose to change my waste exemptions
      And I select waste activity "We use waste in manufacturing or for a specified purpose"
      And I select waste activity "We sort, blend and recover waste"
      And I select waste activity "We store waste"
      And I select exemption "U9 T12 S1" from the activities list
      And I confirm my waste exemption selections
     Then I can see the waste exemptions chosen have been updated
@beta
Scenario: User can change their applicant details from the check your answers page
    Given I am participating in the private beta
      And I confirm my waste activities are "not" on a farm
      And I enter my business details for a "limited_company"
      And I select waste activity "We use waste in building and construction"
      And I select exemption "U1" from the activities list
      And I confirm my waste exemption selections
      And I enter the registration details
      And I am on the check your answers page
     When I change my applicant details
     Then I can see my applicant details have been updated
@beta
Scenario: User can change the business address from check your answers page
    Given I am participating in the private beta
      And I confirm my waste activities are "not" on a farm
      And I enter my business details for a "local_authority"
     When I select waste activity "We use waste in building and construction"
      And I select exemption "U1" from the activities list
      And I confirm my waste exemption selections
      And I enter the registration details
     When I am on the check your answers page
     When I change the business address
     Then I can see the business address has been updated
@beta
Scenario: User can change the site location from a grid reference to an address from check your answers page
    Given I am participating in the private beta
      And I confirm my waste activities are "not" on a farm
      And I enter my business details for a "local_authority"
     When I select waste activity "We use waste in building and construction"
      And I select exemption "U1" from the activities list
      And I confirm my waste exemption selections
      And I enter the registration details
     When I am on the check your answers page
     When I change to a site address
     Then I can see the site address on the check your answers page
@beta
Scenario: User can partner details from check your answers page
    Given I am participating in the private beta
      And I confirm my waste activities are "not" on a farm
      And I enter my business details for a "partnership"
     When I select waste activity "We use waste in building and construction"
      And I select exemption "U1" from the activities list
      And I confirm my waste exemption selections
      And I enter the registration details
      And I am on the check your answers page
     When I add another partner
     Then I can see the partner added to the check your answers page