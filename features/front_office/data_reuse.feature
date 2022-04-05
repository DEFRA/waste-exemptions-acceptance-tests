@frontoffice @regi
Feature: Registering a waste exemption
  As a waste holder
  I want to be able to opt to use previously entered data
  So that I don't have to repeat myself

  Scenario: Applicants details can be used for later in registration
      Given I start a new waste exemption registration
      When I register choosing to reuse my contact details
      Then I am on the check your answers page
      And my phone number is used for the contact phone number
      And my email address is used for the contact email address
      And my business address is used for the contact address

