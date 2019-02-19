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
@ts @email
 Scenario: System user adds new user
 Given I sign in as a system user
   And I invite a new back office user
  When the invite is accepted
   And a password is set
  Then the new back office user can sign in




