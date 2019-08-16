@backoffice @regb
Feature: Back office user completes assisted digital registration for a user
  As an admin agent
  I need to register a waste exemption activity
  So that I can register exemptions on behalf of assisted digital users

  Scenario: Registration of a limited company by a back office user
  	Given I sign in as an admin agent
     When I complete a "limited_company" registration
     Then I will be informed the registration is complete

  Scenario: Registration of a partnership by a back office user
    Given I sign in as an admin agent
     When I complete a "partnership" registration
     Then I will be informed the registration is complete

  Scenario: Registration of a partnership by a back office user
    Given I sign in as an admin agent
     When I complete an "llp" registration
     Then I will be informed the registration is complete
