@backoffice @new
Feature: Back office user completes assisted digital registration for a customers new waste exemption activity
  As a back office user
  I want to register a waste exemption activity
  So that I can register exemptions for customers over the phone

  Scenario: Registration of limited companies waste exemnption activity by a NCCC user
  	Given I sign in as a super agent
     When I complete a limited companies registration
     Then I will be informed the registration is complete

  Scenario: Registration of Partnerships waste exemnption activity by a NCCC user
    Given I sign in as a super agent
     When I complete a partnerships registration
     Then I will be informed the registration is complete

  Scenario: Registration of individuals waste exemnption activity by a NCCC user
    Given I sign in as a super agent
     When I complete an individuals registration
     Then I will be informed the registration is complete

  
  Scenario: Registration of LLPs waste exemnption activity by a NCCC user
    Given I sign in as a super agent
     When I complete an LLPs registration
     Then I will be informed the registration is complete

  Scenario: Registration of Local authorities waste exemnption activity by a NCCC user
    Given I sign in as a super agent
     When I complete a local authorities registration
     Then I will be informed the registration is complete

  Scenario: Registration of Charities waste exemnption activity by a NCCC user
    Given I sign in as a super agent
     When I complete a charities registration
     Then I will be informed the registration is complete

  Scenario: Data agent can not create new registrations
  	Given I sign in as a data agent
     When I am on the main dashboard
     Then I will not be able to create a new registration 
