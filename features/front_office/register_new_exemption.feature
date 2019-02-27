@frontoffice @happy_path
Feature: Registering a waste exemption
  As a waste holder
  I want to register a waste activity exemption
  So that know that I am complying with regulations

  Background:
    Given I start a new waste exemption registraton
    
@smoke
  Scenario: Registration by an individual
    Given I am an individual
     When I register an exemption "S1"
     Then I will be informed the registration is complete
      
@email
  Scenario: Registration by a limited company
    Given I am a limited company
     When I register an exemption
     Then I will be informed the registration is complete
      And I will receive a confirmation email

  Scenario: Registration by a limited liability partnership
    Given I am a limited liability partnership
     When I register an exemption
     Then I will be informed the registration is complete

  Scenario: Registration by a partnership
    Given I am a partnership
     When I register multiple exemptions
     Then I will be informed the registration is complete

  Scenario: Registration by a local authority
   Given I am a local authority
    When I register an exemption
    Then I will be informed the registration is complete

  Scenario: Registration by a charity
   Given I am a charity
    When I register an exemption
    Then I will be informed the registration is complete  

