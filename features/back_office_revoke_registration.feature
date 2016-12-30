@backoffice
Feature: Back office user registers a customers new waste exemption activity
  As an back office user
  I want to revoke a waste exemption
  So that I can deregister the exemption activity

  Background:
    Given I am an internal user
      And I have a valid username and password
      And I complete a registration

  @happy_path
  Scenario: Revoking registration by NCCC user
     When I revoke a registration
     Then I will be informed the registration is revoked
