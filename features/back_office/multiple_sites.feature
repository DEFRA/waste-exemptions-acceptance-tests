@backoffice @multiple
Feature: Managing multiple site registrations in the back office

Background: Sign in and create a multiple site registration
    Given I have a valid registration for 30 sites
     
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
