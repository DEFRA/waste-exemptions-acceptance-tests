@backoffice
Feature: Back office user ceases a customers waste exemption activity
  As an back office user
  I want to cease a waste exemption
  So that I can deregister the exemption activity

  Background:
    Given I am an internal user
      And I have a valid username and password
      And I complete a registration

  @happy_path
  Scenario: Ceasing a registration by NCCC user
     When I cease a registration
     Then I will see the registration is deregistered
