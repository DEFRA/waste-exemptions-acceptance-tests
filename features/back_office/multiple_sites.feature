Feature: Managing multiple site registrations in the back office

Background: Sign in and create a multiple site registration
    Given I sign in as an admin team user
      And I start an assisted digital registration
      And I confirm my waste activities are "not on" a farm
      And I enter my business details for a "limited_company"
      And I select waste activity "We use waste in building and construction"
      And I select exemption "U1" from the activities list 
      And I confirm my waste exemption selections
      And I confirm my exemption is for multiple sites
      And I enter the grid reference for a site
      And I enter the grid reference for another 29 sites
      And I confirm I have added all my sites
     Then I confirm the charge summary
      And I enter the registration details
      And I confirm the registration details
     When I pay by card
     Then I will see a registration confirmation

Scenario: Multiple site registration can have all sites deregistered
  When I deregister a whole registration
  Then the registration is no longer active
   And each site has been deregistered

@skip
Scenario: Multiple site registration can have individual sites deregistered
  When I deregister a site