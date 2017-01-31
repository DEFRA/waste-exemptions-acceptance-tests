@backoffice
Feature: Back office users can create confirmation letter exports
  As a back office user
  I need the ability to create confirmation letters for a given period
  So that I send all assisted digital registrations proof of their registration

  Background:
    Given I am an internal user
      And I have a valid username and password

  @happy_path
  Scenario: Back office user exports confirmation letters
     When I export confirmation letters for today
     Then I will see the confirmation letter export status as complete
