@backoffice @deregister
Feature: Back office user deregisters exemptions
  As an admin team user
  I need to deregister a waste exemption activity
  So that I can correctly mark it as revoked or ceased

  Background: Register an exemption
    Given I have a valid registration
      And I sign in as an admin team user
      And I view a registration's sites information
@skip
  Scenario: [RUBY-63] Deregister individual exemptions
     When I deregister individual exemptions
     Then the exemptions are no longer active

  Scenario: [RUBY-64] Deregister a whole registration
     When I deregister a whole registration
     Then the registration is no longer active
@skip
  Scenario: Ceased exemption details can be viewed from the sites exemptions page
     When I "cease" an exemption
     Then I can see the deregistration details from the site's exemptions page