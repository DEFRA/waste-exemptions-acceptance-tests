@backoffice @new
Feature: Back office user completes assisted digital registration for a customers new waste exemption activity
  As a back office user
  I want to register a waste exemption activity
  So that I can register exemptions for customers over the phone

  @happy_path @ts
  Scenario: Registration by a NCCC user
  	 Given I sign in as a super agent
     When I complete a limited company registration
     Then I will be informed the registration is complete

  Scenario: Data agent can not create new registrations
  	Given I sign in as a data agent
     When I am on the main dashboard
     Then I will not be able to create a new registration 
