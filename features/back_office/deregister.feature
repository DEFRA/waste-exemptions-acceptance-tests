@backoffice @deregister
Feature: Back office user deregisters exemptions
  As an admin agent
  I need to deregister a waste exemption activity
  So that I can correctly mark it as revoked or ceased

  Background: Register an exemption
    Given I have a valid registration

  Scenario: [RUBY-63] Deregister individual exemptions
    Given I sign in as a super agent
     When I deregister individual exemptions
     Then the exemptions are no longer active

  Scenario: [RUBY-64] Deregister a whole registration
    Given I sign in as a super agent
     When I deregister a whole registration
     Then the registration is no longer active

  Scenario: [RUBY-63] Admin agent cannot deregister
     When I sign in as an admin agent
     Then I cannot deregister anything

  Scenario: Ceased exemption details can be viewed from the deregistration details page
    Given I sign in as a super agent
     When I "cease" an exemption
     Then I can see the deregistration details from the deregistration details page