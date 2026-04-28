@frontoffice
Feature: Allow only English sites

    Geospatial check of site location to restrict registration of non English sites

  Background:
    Given I start a new waste exemption registration

  Scenario: Non English grid reference is stopped from registering
     When I select waste activity "We use waste in building and construction"
      And I select exemption "U1" from the activities list
      And I confirm my waste exemption selections
      And I enter a grid reference for a site outside of England
     Then I will be informed the grid reference must be inside England

  Scenario: Non English grid reference is stopped from registering
     When I select waste activity "We use waste in building and construction"
      And I select exemption "U1" from the activities list
      And I confirm my waste exemption selections
      And I enter an address for a site outside of England
     Then I will be informed the address must be inside England

  Scenario: Only English addresses are shown in address lookup
     When I select waste activity "We use waste in building and construction"
      And I select exemption "U1" from the activities list
      And I confirm my waste exemption selections
      And I enter an address for a site with both Welsh and English addresses
     Then I will be informed that only English addresses are shown

 