@changes
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
