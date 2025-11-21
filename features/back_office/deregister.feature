@backoffice @deregister
Feature: Back office user deregisters exemptions
  As an admin team user
  I need to deregister a waste exemption activity
  So that I can correctly mark it as revoked or ceased

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
    
  Scenario: [RUBY-63] Deregister individual exemptions
     When I deregister individual exemptions
     Then the exemptions are no longer active
      But the registration remains active

  Scenario: [RUBY-64] Deregister a whole registration
     When I deregister a whole registration
     Then the registration is no longer active

  Scenario: Ceased exemption details can be viewed from the sites exemptions page
     When I "cease" an exemption
     Then I can see the deregistration details from the site's exemptions page
     
@fix
  Scenario: Revoked exemption is kept when registration is edited
     When I "revoke" an exemption
      And I edit the contact email address
      And I complete the edit
      Then I can see the deregistration details from the site's exemptions page


