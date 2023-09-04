@email @edit
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
   Then I will see the declaration page
    And I will not receive a confirmation email

Scenario: Waste exemption holder modifies contact name
  Given I have a valid registration
    And I click on a valid edit link
    And I choose to change the contact name
   When I submit the contact name form
   Then I will see the main edit page with the updated contact name
   When I click to continue
   Then I will see the declaration page
   When I submit the declaration form
   Then I will see the edit complete page
    And I will receive a confirmation email

Scenario: Waste exemption holder modifies contact email
  Given I have a valid registration
    And I click on a valid edit link
    And I choose to change the contact email
   When I submit the contact email form
   Then I will see the main edit page with the updated contact email
   When I click to continue
   Then I will see the declaration page
   When I submit the declaration form
   Then I will see the edit complete page
    And I will receive a confirmation email

Scenario: Waste exemption holder modifies contact phone number
  Given I have a valid registration
    And I click on a valid edit link
    And I choose to change the contact phone number
   When I submit the contact phone number form
   Then I will see the main edit page with the updated contact phone number
   When I click to continue
   Then I will see the declaration page
   When I submit the declaration form
   Then I will see the edit complete page
    And I will receive a confirmation email

Scenario: Waste exemption holder deregisters some exemptions
  Given I have a valid registration
    And I click on a valid edit link
    And I choose to edit my exemptions
   When I choose to deregister an exemption
    And I confirm deregistration of an exemption in the front-office edit flow
   Then I will see the main edit page with the updated list of exemptions
   When I click to continue
   Then I will see the declaration page
   When I submit the declaration form
   Then I will see the edit complete page
    And I will receive a confirmation email

Scenario: Waste exemption holder deregisters all exemptions
  Given I have a valid registration
    And I click on a valid edit link
    And I choose to edit my exemptions
   When I choose to deregister all current exemptions
    And I confirm deregistration of all my exemptions in the front-office edit flow
   Then I will see the main edit page with an empty list of exemptions
   When I click to continue
   Then I will see the declaration page
   When I submit the declaration form
   Then I will see the edit complete page
    And I will receive a deregistration confirmation email
