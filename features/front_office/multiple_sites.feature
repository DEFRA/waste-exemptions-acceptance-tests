@frontoffice @multiple
Feature: Adding multiple sites to a registration
  As a user
  I want to be able to add multiple sites to my waste exemption registration
  So that I can register all my sites in one go
  
  Background: Create registration
    Given I start a new waste exemption registration

  Scenario: User can continue with registration after adding required number of 30 sites
    Given I select waste activity "We use waste in building and construction"
      And I select exemption "U1" from the activities list 
      And I confirm my waste exemption selections
      And I confirm my exemption is for multiple sites
      And I enter the grid reference for a site
      And I enter the grid reference for another 29 sites
      And I confirm I have added all my sites
      And I confirm my waste activities are "not on" a farm
      And I confirm my organisation is not a charity
     Then I am shown the multiple site registration charge summary

  Scenario: User can not continue with registration after deleting thirtieth site
    Given I select waste activity "We use waste in building and construction"
      And I select exemption "U1" from the activities list 
      And I confirm my waste exemption selections
      And I confirm my exemption is for multiple sites
      And I enter the grid reference for a site
      And I enter the grid reference for another 29 sites
      But I delete a site
     Then I cannot continue with my registration

