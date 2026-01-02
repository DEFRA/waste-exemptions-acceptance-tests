@backoffice @system
Feature: Carry out system tasks
  As a back office user
  I need to manage other users and perform admin tasks
  So that the service is used appropriately

  Background:
  Given I have a valid registration

  @email
  Scenario: Admin team leader adds a new user
    Given I sign in as a admin team leader
     When I invite a new back office user
      And the invite is accepted
     Then a password is set
      And the new back office user can sign in
      And the new back office user cannot change their password

  Scenario: Service manager changes a user's role
    Given I sign in as a service manager
     When I change a users role to data agent
     Then I see their role has changed

  Scenario: Service manager deactivates a user
    Given I sign in as a service manager
     When I deactivate a user
     Then I see their status has changed
 
  Scenario: User is an admin team leader
    Given I sign in as a admin team leader
     Then I can access the user management screen
      And I will have the option to create a new registration
      And I can access create a new registration
      And I can search for registrations
      And I can view their details
      And I can access data exports
      But I cannot toggle features

  Scenario: User is an admin team user
    Given I sign in as an admin team user
     Then I can access the user management screen
      But I will have the option to create a new registration
      And I can access create a new registration
      And I can search for registrations
      And I can view their details
      And I can access data exports
      But I cannot toggle features
      And I can edit the most recent registration

  Scenario: User is a data viewer user
    Given I sign in as a data viewer user
     Then I will not have the option to manage users
      And I cannot access the user management screen
      And I will not have the option to create a new registration
      And I cannot access create a new registration
      But I can search for registrations
      And I can view their details
      But I can access data exports
      But I cannot edit the most recent registration
      But I cannot toggle features

  Scenario: User is a developer
    Given I sign in as a developer
     Then I will not have the option to manage users
      And I cannot access the user management screen
      But I will have the option to create a new registration
      And I can access create a new registration
      And I can search for registrations
      And I can view their details
      And I can access data exports
      And I can toggle features
      But I can edit the most recent registration
      And I can access the charge and band management screens

  Scenario: User is a service manager
    Given I sign in as a service manager
     Then I can access the user management screen
      And I will have the option to create a new registration
      And I can access create a new registration
      And I can search for registrations
      And I can view their details
      And I can access data exports
      And I cannot toggle features
      And I can edit the most recent registration
      And I can access the charge and band management screens

  Scenario: User is a policy adviser
    Given I sign in as a policy adviser
     Then I can access the user management screen
      And I can access data exports
      And I can access the charge and band management screens
      And I will not have the option to create a new registration
      And I cannot access create a new registration
      But I cannot edit the most recent registration
      And I cannot toggle features