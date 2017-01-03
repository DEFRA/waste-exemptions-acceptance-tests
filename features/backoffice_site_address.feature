@backoffice
Feature: Back office user registers a customers new waste exemption activity
  As a back office user
  I want to register a waste exemption
  So that I can register exemptions for customers over the phone

  Background:
    Given I am an internal user
      And I have a valid username and password

  @happy_path
  Scenario: Registration by a NCCC user using a postcode for site address - NGR and area is added to registration
     When I complete a registration using a postcode for site address
     Then I will be able to check what the National Grid Reference is for the site
     And I will be told what area that site is located in


      