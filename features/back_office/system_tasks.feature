@backoffice @data @email @system
Feature: Carry out system tasks
  As a back office user
  I need to manage other users and perform admin tasks
  So that the service is used appropriately

  The commented tests are broken as it requires a new, random email address to be set up.
  Notify trial mode can only accept 5 specified email addresses.
  Uncomment this test when we move out of trial mode.
  # @email
  # Scenario: System user adds a new user
  #   Given I sign in as a system user
  #   When I invite a new back office user
  #   And the invite is accepted
  #   Then a password is set
  #   And the new back office user can sign in
  #   And the new back office user cannot change their password

  # Scenario: System user changes a user's role
  #   Given I sign in as a system user
  #   When I change a users role to super agent
  #   Then I see their role has changed

  # Scenario: System user deactivates a user
  #   Given I sign in as a system user
  #   When I deactivate a user
  #   Then I see their status has changed

  Scenario: User is a system_user
    Given I sign in as a system user
    Then I can access the user management screen
    And I will have the option to create a new registration
    And I can access create a new registration
    And I can search for registrations
    And I can view their details
    And I can continue an in progress registration
    And I can access data exports
    And I can download letters
    But I cannot toggle features

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
    And I can download letters
    But I cannot toggle features

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
    And I can download letters
    But I cannot toggle features
    And I cannot edit the most recent registration

  Scenario: User is a data_agent
    Given I sign in as a data agent
    Then I will not have the option to manage users
    And I cannot access the user management screen
    And I will not have the option to create a new registration
    And I cannot access create a new registration
    But I can search for registrations
    And I can view their details
    But I cannot continue an in progress registration
    But I can access data exports
    But I cannot edit the most recent registration
    But I cannot download letters
    But I cannot toggle features

  Scenario: User is a developer
    Given I sign in as a developer
    Then I will not have the option to manage users
    And I cannot access the user management screen
    But I will have the option to create a new registration
    And I can access create a new registration
    And I can search for registrations
    And I can view their details
    And I can continue an in progress registration
    And I can access data exports
    And I can download letters
    And I can toggle features
    But I cannot edit the most recent registration
