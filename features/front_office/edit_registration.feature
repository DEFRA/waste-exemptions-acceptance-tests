@frontoffice @email @fo_edit
Feature: Edit / deregistration self-serve

As a waste exemption holder
I want to be able to edit my contact details and/or deregister some or all of my exemptions
So my registration is up to date and accurate

Background: Create registration
    Given I start a new waste exemption registration
    And I confirm my waste activities are "not on" a farm
      And I enter my business details for a "partnership"
      And I select waste activity "We use waste in building and construction"
      And I select exemption "U1 U2 U3" from the activities list 
      And I confirm my waste exemption selections
      And I confirm my exemption is for a single site
      And I confirm the charge summary
      And I enter the registration details
      And I confirm the registration details
     When I pay by card
     Then I will see a registration confirmation
     And I will receive a registration confirmation email
     And I sign in as an admin team user
     And I choose to amend my registration details from the email invite

Scenario: Waste exemption holder opts to make no changes
   When I choose to make no changes
   Then I submit the declaration form
    And I will not receive a confirmation email

Scenario: Waste exemption holder modifies contact name
  When I choose to change the contact name
   When I submit the contact name form
   Then I will see the main edit page with the updated contact name
   When I confirm my registration changes
   Then I will see the edit complete page
    And I will receive a confirmation email

Scenario: Waste exemption holder modifies contact email
  When I choose to change the contact email
   When I submit the contact email form
   Then I will see the main edit page with the updated contact email
   When I confirm my registration changes
   Then I will see the edit complete page
    And I will receive a confirmation email

Scenario: Waste exemption holder modifies contact phone number
  When I choose to change the contact phone number
   When I submit the contact phone number form
   Then I will see the main edit page with the updated contact phone number
   When I confirm my registration changes
   Then I will see the edit complete page
    And I will receive a confirmation email
    
Scenario: Waste exemption holder deregisters some exemptions
   When I choose to edit my exemptions
   When I choose to deregister an exemption
    And I confirm my exemption changes
   Then I will see the main edit page with the updated list of exemptions
   When I confirm my registration changes
   Then I will see the edit complete page
    And I will receive a confirmation email

Scenario: Waste exemption holder deregisters all exemptions
   When I choose to edit my exemptions
   When I choose to deregister all current exemptions
    And I confirm full deregistration
   Then I will see the main edit page with an empty list of exemptions
   When I confirm my registration changes
   Then I will see the deregistration confirmation page
    And I will receive a deregistration confirmation email
    And choose to deregister exemptions from the email invite

Scenario: Waste exemption holder changes address 
   When I choose to change the contact address
    And I update the contact address
   Then I will see the main edit page with the updated contact address
   When I confirm my registration changes
   Then I will see the edit complete page
    And I will receive a confirmation email

Scenario: Waste exemption holder changes address to manual address
   When I choose to change the contact address
    And I update the contact address to a manual address
   Then I will see the main edit page with the updated contact address
   When I confirm my registration changes
   Then I will see the edit complete page
    And I will receive a confirmation email
