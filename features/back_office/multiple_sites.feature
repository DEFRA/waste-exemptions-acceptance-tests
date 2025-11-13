@multiple
Feature: Managing multiple site registrations in the back office

Background: Sign in and create a multiple site registration
    Given I sign in as an admin team user
      And I start an assisted digital registration
      And I confirm my waste activities are "not on" a farm
      And I enter my business details for a "limited_company"
      And I select waste activity "We use waste in building and construction"
      And I select exemptions "U1 U2 U3" from the activities list
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

  Scenario: Multiple site registration can have individual sites deregistered
     When I "cease" a site
     Then the site is no longer active
      And each exemption on the site has been "ceased"
      But the registration remains active

 Scenario: Multiple site registration can have individual exemptions deregistered
     When I "cease" an exemption on a site
     Then the exemption on the site has been "ceased"
      But the site remains active
      And the registration remains active
      And I can see the deregistration details from the site's exemptions page
