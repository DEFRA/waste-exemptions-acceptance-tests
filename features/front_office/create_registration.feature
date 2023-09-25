@frontoffice @reg
Feature: Registering a waste exemption
  As a waste holder
  I want to register a waste activity exemption
  So that know that I am complying with regulations
  
    Scenario: Registration by an individual
      Given my business is an "individual"
      When I register an exemption
      Then I will be informed the registration is complete
      And I will receive a registration confirmation email

  @smoke
    Scenario: Registration by a local authority
      Given my business is a "local_authority"
      When I register an exemption
      Then I will be informed the registration is complete

    Scenario: Registration by a limited company
      Given my business is a "limited_company"
      When I register an exemption
      Then I will be informed the registration is complete

    Scenario: Registration by a charity
      Given my business is a "charity"
      When I register an exemption
      Then I will be informed the registration is complete
      And I will receive a registration confirmation email

    Scenario: Choose locations outside England
      Given I start a new waste exemption registration
      When I choose locations outside England
      Then I will be advised to register with another authority

    Scenario: Select option to deregister/update details
      Given I am on the service
      When I select the option to deregister or update details
      Then I will be asked to enter my waste registration number
