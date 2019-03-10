@backoffice
Feature: Manage back office users
  As a system user
  I need to be able to add new and manage existing back office users
  So people can access the service

  Background:
	  Given I sign in as a system user

  @email
  Scenario: System user adds a new user
     When I invite a new back office user
      And the invite is accepted
     Then a password is set
      And the new back office user can sign in

  @data
  Scenario: System user changes a users role
     When I change a users role to super agent
     Then I see their role has changed

  @data
  Scenario: System user deactivates a user
     When I deactivate a user
     Then I see their status has changed
