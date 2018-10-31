@frontoffice
Feature: Individual registers a waste exemption
  As a waste holder
  I want to register a waste activity exemption
  So that know that I am complying with regulations

  Background:
    Given start a new waste exemption registraton

  @happy_path
  Scenario: Registration by an individual
    Given I am an individual
     When I register an exemption
     Then I will be informed the registration is complete

  @happy_path
  Scenario: Registration by a limited company
    Given I am a limited company
     When I register an exemption
     Then I will be informed the registration is complete

  @happy_path
  Scenario: Registration by a limited liability partnership
    Given I am a limited liability partnership
     When I register an exemption
     Then I will be informed the registration is complete

  @happy_path
  Scenario: Registration by a partnership
    Given I am a partnership
     When I register an exemption for a partnership
     Then I will be informed the registration is complete
