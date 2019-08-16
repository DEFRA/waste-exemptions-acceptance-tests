@backoffice @data @email @system @broken
Feature: Carry out system tasks
  As a back office user
  I need to manage other users and perform admin tasks
  So that the service is used appropriately

  # This feature is marked as broken because the @data tag no longer calls the before hook,
  # if running this test as part of a suite. However, running this test in isolation works.
  # RUBY-489 has been raised to fix this.

  @email
  Scenario: System user adds a new user
	  Given I sign in as a system user
     When I invite a new back office user
      And the invite is accepted
     Then a password is set
      And the new back office user can sign in
      And the new back office user cannot change their password

  Scenario: System user changes a users role
	  Given I sign in as a system user
     When I change a users role to super agent
     Then I see their role has changed

  Scenario: System user deactivates a user
	  Given I sign in as a system user
     When I deactivate a user
     Then I see their status has changed

  Scenario: User is a system_user
    Given I sign in as a system user
     Then I can access the user management screen
      And I will have the option to create a new registration
      And I can access create a new registration
      And I can search for registrations
      And I can view their details
      And I can continue an in progress registration
      And I can access data exports

  Scenario: User is a super_agent
    Given I sign in as a super agent
     Then I will not have the option to manage users
      And I cannot access the user management screen
      But I will have the option to create a new registration
      And I can access create a new registration
      But I can search for registrations
      And I can view their details
      And I can continue an in progress registration
      And I can access data exports

  Scenario: User is an admin_agent
    Given I sign in as an admin agent
     Then I will not have the option to manage users
      And I cannot access the user management screen
      But I will have the option to create a new registration
      And I can access create a new registration
      And I can search for registrations
      And I can view their details
      And I can continue an in progress registration
      And I can access data exports
      But I cannot edit the most recent registration

  Scenario: User is a data_agent
    Given I sign in as an data agent
     Then I will not have the option to manage users
      And I cannot access the user management screen
      And I will not have the option to create a new registration
      And I cannot access create a new registration
      But I can search for registrations
      And I can view their details
      But I cannot continue an in progress registration
      But I can access data exports
      But I cannot edit the most recent registration
