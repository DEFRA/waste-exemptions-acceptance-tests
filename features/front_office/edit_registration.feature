@email @fo_edit
Feature: Edit / deregistration self-serve

As a waste exemption holder
I want to be able to edit my contact details and/or deregister some or all of my exemptions
So my registration is up to date and accurate

Scenario: Invalid edit link
  When I click on an invalid edit link
  Then I will see the invalid link page

Scenario: Waste exemption holder opts to make no changes
  Given I have a valid registration
   When I click on a valid edit link
    And I choose to make no changes
   Then I submit the declaration form
    And I will not receive a confirmation email

Scenario: Waste exemption holder modifies contact name
  Given I have a valid registration
    And I click on a valid edit link
    And I choose to change the contact name
   When I submit the contact name form
   Then I will see the main edit page with the updated contact name
   When I confirm my registration changes
   Then I will see the edit complete page
    And I will receive a confirmation email

Scenario: Waste exemption holder modifies contact email
  Given I have a valid registration
    And I click on a valid edit link
    And I choose to change the contact email
   When I submit the contact email form
   Then I will see the main edit page with the updated contact email
   When I confirm my registration changes
   Then I will see the edit complete page
    And I will receive a confirmation email

Scenario: Waste exemption holder modifies contact phone number
  Given I have a valid registration
    And I click on a valid edit link
    And I choose to change the contact phone number
   When I submit the contact phone number form
   Then I will see the main edit page with the updated contact phone number
   When I confirm my registration changes
   Then I will see the edit complete page
    And I will receive a confirmation email
    
Scenario: Waste exemption holder deregisters some exemptions
  Given I have a valid registration
    And I click on a valid edit link
    And I choose to edit my exemptions
   When I choose to deregister an exemption
    And I confirm my exemption changes
   Then I will see the main edit page with the updated list of exemptions
   When I confirm my registration changes
   Then I will see the edit complete page
    And I will receive a confirmation email

Scenario: Waste exemption holder deregisters all exemptions
  Given I have a valid registration
    And I click on a valid edit link
    And I choose to edit my exemptions
   When I choose to deregister all current exemptions
    And I confirm full deregistration
   Then I will see the main edit page with an empty list of exemptions
   When I confirm my registration changes
   Then I will see the deregistration confirmation page
    And I will receive a deregistration confirmation email

Scenario: Waste exemption holder can receive an invite to edit their registration from the back office
   Given I have a registration "outside" of the renewal window
   When I choose to deregister exemptions from the email invite
   Then I will see the main edit page

Scenario: Waste exemption holder changes address 
  Given I have a valid registration
    And I click on a valid edit link
   When I choose to change the contact address
    And I update the contact address
   Then I will see the main edit page with the updated contact address
   When I confirm my registration changes
   Then I will see the edit complete page
    And I will receive a confirmation email

Scenario: Waste exemption holder changes address to manual address
  Given I have a valid registration
    And I click on a valid edit link
   When I choose to change the contact address
    And I update the contact address to a manual address
   Then I will see the main edit page with the updated contact address
   When I confirm my registration changes
   Then I will see the edit complete page
    And I will receive a confirmation email
