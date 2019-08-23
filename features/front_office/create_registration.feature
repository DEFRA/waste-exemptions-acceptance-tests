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

    Scenario: Registration by a partnership
     Given my business is a "partnership"
      When I register an exemption
      Then I will be informed the registration is complete

    Scenario: Registration by an LLP
      Given my business is an "llp"
       When I register an exemption
       Then I will be informed the registration is complete

    Scenario: Registration by a local authority
      Given my business is a "local_authority"
       When I register an exemption
       Then I will be informed the registration is complete

    Scenario: Registration by a charity
      Given my business is a "charity"
       When I register an exemption
       Then I will be informed the registration is complete

    Scenario: Registration by a limited company
     Given my business is a "limited_company"
      When I register an exemption
      Then I will be informed the registration is complete
