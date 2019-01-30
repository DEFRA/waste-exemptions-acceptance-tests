@backoffice @broken
Feature: Back office users can 'deregister' the whole registration
  As a back office user
  I need the ability to deregister a registration
  Because the customer may no longer require it (ceased)
  Or the business needs to revoke it

  Background:
    Given I sign in as a super agent
      
  Scenario: Revoking a registration with multiple exemptions
     When I have a registration with the exemptions "D2, S1"
      And I "revoke" the registration
     Then I can see all exemptions are "Revoked"
      And I can also see the registration is "Revoked"

  
  Scenario: Ceasing a registration with multiple exemptions
     When I have a registration with the exemptions "D2, S1"
      And I "cease" the registration
     Then I can see all exemptions are "Ceased"
      And I can also see the registration is "Ceased"

  
  Scenario: Revoking a registration with only one exemption
     When I have a registration with the exemptions "S1"
      And I "revoke" the registration
     Then I can see the exemption is "Revoked"
      And I can also see the registration is "Revoked"

 
  Scenario: Ceasing the only exemption on a registration
     When I have a registration with the exemptions "S1"
      And I "cease" the registration
     Then I can see the exemption is "Ceased"
      But I can also see the registration is "Ceased"
