@backoffice
Feature: Back office users can 'deregister' individual exemptions
  As a back office user
  I need the ability to deregister individual exemptions
  Because the customer may no longer require it (ceased)
  Or the business needs to revoke it

  Background:
    Given I sign in as a super user
      

  @happy_path
  Scenario: Revoking one exemption on a registration with multiple exemptions
     When I have a registration with the exemptions "D2, S1"
      And I "revoke" an exemption
     Then I can see the exemption is "Revoked"
      But I can also see the registration is "Active"

  @happy_path
  Scenario: Ceasing one exemption on a registration with multiple exemptions
     When I have a registration with the exemptions "D2, S1"
      And I "cease" an exemption
     Then I can see the exemption is "Ceased"
      But I can also see the registration is "Active"

  @happy_path @broken
  Scenario: Revoking all exemptions on a registration with multiple exemptions
     When I have a registration with the exemptions "D2, S1"
      And I "revoke" an exemption
     Then I can see the exemption is "Revoked"
      But When I "revoke" the last active exemption
     Then I can also see the registration is "Revoked"

  @happy_path @broken
  Scenario: Ceasing all exemptions on a registration with multiple exemptions
     When I have a registration with the exemptions "D2, S1"
      And I "cease" an exemption
     Then I can see the exemption is "Ceased"
      But When I "cease" the last active exemption
     Then I can also see the registration is "Ceased"

  @happy_path @broken
  Scenario: Revoking and ceasing all exemptions on a registration with multiple exemptions
     When I have a registration with the exemptions "D2, S1"
      And I "revoke" an exemption
     Then I can see the exemption is "Revoked"
      But When I "cease" the last active exemption
     Then I can also see the registration is "Revoked"

  @happy_path @broken
  Scenario: Revoking the only exemption on a registration
     When I have a registration with the exemptions "S1"
      And I "revoke" an exemption
     Then I can see the exemption is "Revoked"
      But I can also see the registration is "Revoked"

  @happy_path @broken
  Scenario: Ceasing the only exemption on a registration
     When I have a registration with the exemptions "S1"
      And I "cease" an exemption
     Then I can see the exemption is "Ceased"
      But I can also see the registration is "Ceased"
