@expiry_extension
Feature: Expiry date extensions

    Exemption expiry dates can be extended, with the reason for change tracked in the change history

  Background: Register an exemption
    Given I sign in as an admin team user
      And I start an assisted digital registration
      And I confirm my waste activities are "not on" a farm
      And I enter my business details for a "llp"
      And I select waste activity "We use waste in building and construction"
      And I select exemptions "U1 U2 U3" from the activities list
      And I confirm my waste exemption selections
      And I confirm my exemption is for a single site
      And I confirm the charge summary
      And I enter the registration details
      And I confirm the registration details
      And I pay by card
      And I will see a registration confirmation
      And I view a registration's sites information

Scenario: Registration exemption expiry dates can be extended with the reason for change tracked in the change history
    Given I sign in as an admin team user
     When I extend the registration's exemption expiry date
     Then I can see the exemption expiry date has extended
      And I can see the change recorded on the change history page