@backoffice @wip
Feature: Back office user deregisters a waste exemption activity from a registration
  As a back office user
  I want to deregister a waste exemption
  So that the exemption is deregistered for a valid registration with mutlipe exemptions

  Background:
    Given I am an internal user
      And I have a valid username and password

  @happy_path
  Scenario: Deregistration of an exemption for an active registration by a NCCC user
  When I complete a registration
