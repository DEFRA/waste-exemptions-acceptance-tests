@backoffice @expiry_extension
Feature: Expiry date extensions

    Exemption expiry dates can be extended, with the reason for change tracked in the change history

  Background: Register an exemption
    Given I have a valid registration 

Scenario: Registration exemption expiry dates can be extended with the reason for change tracked in the change history
    Given I sign in as an admin team user
     When I extend the registration's exemption expiry date
     Then I can see the exemption expiry date has extended
      And I can see the change recorded on the change history page