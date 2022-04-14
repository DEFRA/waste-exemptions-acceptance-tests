@frontoffice @reg
Feature: Registering a waste exemption
  As a waste holder
  I want to be able to opt to use previously entered data
  So that I don't have to repeat myself

  Scenario: Applicants details can be used later in registration
      Given I start a new waste exemption registration
      When I register choosing to reuse my business information previously entered
      Then I am on the check your answers page
      And my phone number is used for the contact phone number
      And my email address is used for the contact email address
      And my business address is used for the contact address
      And my business address is used for the site address

  Scenario: Site location address can be chosen from business and contact addresses
    Given I start a new waste exemption registration
    When I register choosing different business and contact addresses
    Then I am on the check site address page
    And I have the option to choose business, contact address or choose another address