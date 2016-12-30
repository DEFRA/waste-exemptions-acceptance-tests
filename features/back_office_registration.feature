@backoffice
Feature: Back office user registers a customers new waste exemption activity
  As a back office user
  I want to register a waste exemption
  So that I can register exemptions for customers over the phone

  Background:
    Given I am an internal user
      And I have a valid username and password

  @happy_path
  Scenario: Registration by a NCCC user
     When I complete a registration
     Then I will be informed the registration is complete
