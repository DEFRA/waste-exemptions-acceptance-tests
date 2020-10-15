@frontoffice @reg
Feature: Registering a waste exemption
  As a waste holder
  I want to register a waste activity exemption
  So that know that I am complying with regulations

  @smoke
    Scenario: Registration by an individual
      Given my business is an "individual"
      When I register an exemption
      Then I will be informed the registration is complete
      And I can access the footer links

    Scenario: Registration by a limited company with errors
      Given my business is a "limited_company"
      When I complete a registration badly
      Then I will be informed the registration is complete

    Scenario: Registration by a local authority
      Given my business is a "local_authority"
      When I register an exemption
      Then I will be informed the registration is complete

    Scenario: Registration by a charity
      Given my business is a "charity"
      When I register an exemption
      Then I will be informed the registration is complete

    Scenario: Choose locations outside England
      Given I start a new waste exemption registration
      When I choose locations outside England
      Then I will be advised to register with another authority

    Scenario: Select option to change details
      Given I am on the service
      When I select the option to change details
      Then I will be advised to contact the EA
