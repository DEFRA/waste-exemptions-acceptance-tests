@frontoffice
Feature: Individual registers a waste exemption
  As an individual
  I want to register a waste exemption
  So that ...

  Background:
    Given I am an external user
      And I select a new exemption

 @frontoffice @happy_path
 Scenario: Registration by an individual
 Given I am an individual
 When I register an exemption
 Then I will be informed the registration is complete

 @frontoffice @happy_path
 Scenario: Registration by an limited company
 Given I am a limited company
 When I register an exemption
 Then I will be informed the registration is complete
