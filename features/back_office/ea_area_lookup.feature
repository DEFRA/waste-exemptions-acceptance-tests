@ea_area_lookup
Feature: Finding EA area of site location

Background: Create registration and sign into back office
    Given I sign in as an admin team user
      And I start an assisted digital registration
      And I confirm my waste activities are "not on" a farm
      And I enter my business details for a "llp"
      And I select waste activity "We use waste in building and construction"
      And I select exemption "U1" from the activities list 
      And I confirm my waste exemption selections
      And I confirm my exemption is for a single site
      And I confirm the charge summary

Scenario Outline: Grid reference provided for site <site> location returns correct EA area <ea_area>  
      When I enter the registration details for site <site>
      And I confirm the registration details
      And I pay by card
     Then I will see a registration confirmation
      And I can see the correct EA area is <ea_area>

      Examples:
          | site              | ea_area                                       | 
          | "SD 91402 09578"  | "Greater Manchester Merseyside and Cheshire"  |
          | "SE 3508500911"   | "Yorkshire"                                   |
          | "TQ6465676136"    | "East Anglia"                                 |
          | "SC 81171 23759"  | "Outside England"                             |

Scenario: Address provided for site location returns correct EA area
    When I enter the registration details
      And I confirm the registration details
      And I pay by card
     Then I will see a registration confirmation
      And I can see the correct EA area is "Yorkshire"
