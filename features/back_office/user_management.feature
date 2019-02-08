@backoffice
Feature: Manage back office users
  As a system user
  I want to be able to add users to the waste exemptions service
  So people can access the service 

Scenario: Data agent can not add users
  Given I sign in as a data agent
  When I am on the waste exemptions dashboard
  Then I will not have the option to manage users

Scenario: Data agent can not add users
 Given I sign in as an admin agent
  When I am on the waste exemptions dashboard
  Then I will not have the option to manage users

Scenario: Super agent can not add users
 Given I sign in as a super agent
  When I am on the waste exemptions dashboard
  Then I will not have the option to manage users

 Scenario: System user adds new user
 Given I sign in as a system user
  When I invite a new user
@ts
Scenario: test
Given I sign in as a system user
  And I search for "WEX000100"
When I deregister "WEX000100"


