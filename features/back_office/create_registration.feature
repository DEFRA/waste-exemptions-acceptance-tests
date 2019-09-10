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

  Scenario: Registration of an LLP by a back office user
    Given I sign in as an admin agent
     When I complete an "llp" registration
     Then I will be informed the registration is complete

  Scenario: Complete a registration on behalf of an external user
    Given I carry out a partial registration
      And I sign in as a super agent
     When I complete an in progress registration
     Then I can find and edit the registration I just submitted
