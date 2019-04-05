@backoffice @data
Feature: Back office users have different roles with different permissions
  As a back office user
  I need to access only the functions relevant to my role
  So that I can perform my duties

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

  Scenario: User is an data_agent
    Given I sign in as an data agent
     Then I will not have the option to manage users
      And I cannot access the user management screen
      And I will not have the option to create a new registration
      And I cannot access create a new registration
      But I can search for registrations
      And I can view their details
      But I cannot continue an in progress registration
      But I can access data exports
