@frontoffice @reg
Feature: Registering a waste exemption
  As a waste holder
  I want to be able to opt to use previously entered data
  So that I don't have to repeat myself

  Scenario: Applicants phone number can be reused for contact phone number
      Given I start a new waste exemption registration
      And I am on the check contact phone page
      When I choose to use this telephone number as a contact number
      Then I will be on the contact check email page

  Scenario: Applicants phone number can be reused for contact phone number
      Given I start a new waste exemption registration
      And I am on the check contact email page
      When I choose to use this email address as a contact email address
      Then I will be on the contact check address page