@frontoffice @charging 
Feature: Charge summary 

As a user I want to see a breakdown of the charges for the exemptions I have chosen

Background:
    Given I start a new waste exemption registration

Scenario: Single band one U1 exemption charges £476
    Given I confirm my waste activities are "not on" a farm
      And I enter my business details
     When I select waste activity "We use waste in building and construction"
      And I select exemption "U1" from the activities list
      And I confirm my waste exemption selections
      And I confirm my exemption is for a single site
     Then I can see the registration charge is £56.00
      And I can see the total charge is £476.00

Scenario: Multiple exemptions of the same band one have discounted exemptions
    Given I confirm my waste activities are "not on" a farm
      And I enter my business details
     When I select waste activity "We use waste in manufacturing or for a specified purpose"
      And I select waste activity "We sort, blend and recover waste"
      And I select waste activity "We store waste"
      And I select exemption "U9 T12 S1" from the activities list
      And I confirm my waste exemption selections
      And I confirm my exemption is for a single site
     Then I can see the registration charge is £56.00
      And I can see the total charge is £628.00

Scenario: Multiple exemptions of different bands 1, 2 and 3
    Given I confirm my waste activities are "not on" a farm
      And I enter my business details
     When I select waste activity "We sort, blend and recover waste"
     And I select waste activity "We chemically treat, wash waste or use anaerobic digestion"
      And I select exemption "T10 T12 T16 T18" from the activities list
      And I confirm my waste exemption selections
      And I confirm my exemption is for a single site 
     Then I can see the registration charge is £56.00
      And I can see the total charge is £658.00

Scenario: Multiple exemptions of different bands 1, 2, 3 and 4
    Given I confirm my waste activities are "not on" a farm
      And I enter my business details
     When I select waste activity "We crush, bale, shred or chip waste"
      And I select waste activity "We store waste"
      And I select waste activity "We burn plant and wood waste"
      And I select waste activity "We deposit spoil, sanitary and plant matter waste"
      And I select exemption "T8 S1 D1 D8" from the activities list
      And I confirm my waste exemption selections
      And I confirm my exemption is for a single site 
     Then I can see the registration charge is £56.00
      And I can see the total charge is £1474.00

@farm
Scenario: Farming waste exemptions are charged the farming compliance change
    Given I confirm my waste activities are "on" a farm
      And I enter my business details
      And I select exemptions "U1 T23" from the "farming" list
      And I confirm my farming waste exemption selections
      And I confirm my exemption is for a single site 
     Then I can see the registration charge is £56.00
      And I can see the total charge is £144.00
@farm
  Scenario: Farming waste exemptions less than farming compliance charge are charged the lesser amount
    Given I confirm my waste activities are "on" a farm
      And I enter my business details
      And I select exemptions "U13" from the "farming" list
      And I confirm my farming waste exemption selections
      And I confirm my exemption is for a single site 
     Then I can see the registration charge is £56.00
      And I can see the total charge is £86.00
      
@farm
  Scenario: Choosing all farming exemptions results in farming compliance change
    Given I confirm my waste activities are "on" a farm
      And I enter my business details
      And I select all exemptions from the list
      And I confirm my farming waste exemption selections
      And I confirm my exemption is for a single site 
     Then I can see the registration charge is £56.00
      And I can see the total charge is £144.00

  @farm
  Scenario: Farming and upper band non farming waste exemptions can be chosen together
    Given I confirm my waste activities are "on" a farm
      And I enter my business details
      And I select exemptions "T23" from the "farming" list
      And I choose to add waste exemptions that are not included in the farming exemptions
     When I select waste activity "We crush, bale, shred or chip waste"
      And I select exemption "T9" from the activities list
      And I confirm my waste exemption selections
      And I confirm my exemption is for a single site 
     Then I can see the registration charge is £56.00
      And I can see the total charge is £1380.00
      
  @farm
  Scenario: Farming and band 1 non farming waste exemptions can be chosen together
    Given I confirm my waste activities are "on" a farm
      And I enter my business details
      And I select exemptions "T23" from the "farming" list
      And I choose to add waste exemptions that are not included in the farming exemptions
     When I select waste activity "We use waste in manufacturing or for a specified purpose"
      And I select exemption "U9" from the activities list
      And I confirm my waste exemption selections
      And I confirm my exemption is for a single site 
     Then I can see the registration charge is £56.00
      And I can see the total charge is £564.00
  
  @farm
  Scenario: Farming and band 2 non farming waste exemptions can be chosen together
    Given I confirm my waste activities are "on" a farm
      And I enter my business details
      And I select exemptions "U13 D6 D7" from the "farming" list
      And I choose to add waste exemptions that are not included in the farming exemptions
     When I select waste activity "We use waste in building and construction"
      And I select exemption "U2" from the activities list
      And I confirm my waste exemption selections
      And I confirm my exemption is for a single site 
     Then I can see the registration charge is £56.00
      And I can see the total charge is £356.00

 @farm
  Scenario: Farming and band 3 non farming waste exemptions can be chosen together
    Given I confirm my waste activities are "on" a farm
      And I enter my business details
      And I select exemptions "U13 D6 D7" from the "farming" list
      And I choose to add waste exemptions that are not included in the farming exemptions
      And I select waste activity "We use effluent or sludge"
      And I select exemption "U7" from the activities list
      And I confirm my waste exemption selections
      And I confirm my exemption is for a single site 
     Then I can see the registration charge is £56.00
      And I can see the total charge is £174.00

  @farm
  Scenario: Farming and band 2 non farming waste exemptions can be chosen together
    Given I confirm my waste activities are "on" a farm
      And I enter my business details
      And I select exemptions "U13 D6 D7" from the "farming" list
      And I choose to add waste exemptions that are not included in the farming exemptions
      When I select waste activity "We use waste in building and construction"
      And I select exemption "U2" from the activities list
      And I confirm my waste exemption selections
      And I confirm my exemption is for a single site 
     Then I can see the registration charge is £56.00
      And I can see the total charge is £356.00  
      
  @farm
  Scenario: Choosing all exemptions from farming and non farming waste exemptions list except T28
    Given I confirm my waste activities are "on" a farm
      And I enter my business details
      And I select all exemptions from the list
      And I choose to add waste exemptions that are not included in the farming exemptions
      And I select all waste activities
      And I select all exemptions from the list
      And I confirm my waste exemption selections
      And I confirm my exemption is for a single site 
     Then I can see the registration charge is £56.00
      And I can see the total charge is £4004.00
  
  Scenario: Choosing all exemptions from non farming waste exemptions list except T28
    Given I confirm my waste activities are "not on" a farm
      And I enter my business details
      And I select all waste activities
      And I select all exemptions from the list
      And I confirm my waste exemption selections
      And I confirm my exemption is for a single site 
     Then I can see the registration charge is £56.00
      And I can see the total charge is £4840.00

  Scenario: Reviewing and selecting same exemption does not duplicate charge
    Given I confirm my waste activities are "not on" a farm
      And I enter my business details for a "limited_company"
      And I select waste activity "We use waste in manufacturing or for a specified purpose"
      And I select exemption "U9" from the activities list
      But I choose I want to change the exemptions I’ve selected
      And I select waste activity "We use waste in manufacturing or for a specified purpose"
      And I select exemption "U9" from the activities list
      And I confirm my waste exemption selections
      And I confirm my exemption is for a single site 
     Then I can see the registration charge is £56.00
      And I can see the total charge is £476.00

  @multiple
  Scenario: Charge summary for multiple site registration with 30 sites
    Given I confirm my waste activities are "not on" a farm
      And I enter my business details
     When I select waste activity "We use waste in manufacturing or for a specified purpose"
      And I select waste activity "We sort, blend and recover waste"
      And I select waste activity "We store waste"
      And I select exemption "U9 T12 S1" from the activities list
      And I confirm my waste exemption selections
      And I confirm my exemption is for multiple sites
      And I enter the grid reference for a site
      And I enter the grid reference for another 31 sites
     Then I am shown the multiple site registration charge summary
      And I can see the registration charge is £56.00
      And I can see the total charge is £18360.00

@farm @multiple
  Scenario: Farming waste exemptions less than farming compliance registered for multiple sites
    Given I confirm my waste activities are "on" a farm
      And I enter my business details
      And I select exemptions "U13" from the "farming" list
      And I confirm my farming waste exemption selections
      And I confirm my exemption is for multiple sites
      And I enter the grid reference for a site
      And I enter the grid reference for another 29 sites
      Then I am shown the multiple site registration charge summary
      And I can see the registration charge is £56.00
      And I can see the total charge is £956.00
      
  @farm @multiple
  Scenario: Farming waste exemptions are charged the farming compliance change registered for multiple sites
    Given I confirm my waste activities are "on" a farm
      And I enter my business details
      And I select exemptions "U1" from the "farming" list
      And I confirm my farming waste exemption selections
      And I confirm my exemption is for multiple sites
      And I enter the grid reference for a site
      And I enter the grid reference for another 29 sites
      Then I am shown the multiple site registration charge summary
      And I can see the registration charge is £56.00
      And I can see the total charge is £2696.00

@multiple 
Scenario: All exemptions chosen for multiple site registration
    Given I confirm my waste activities are "not on" a farm
      And I enter my business details
     And I select all waste activities
      And I select all exemptions from the list
      And I confirm my waste exemption selections
      And I confirm my exemption is for multiple sites
      And I enter the grid reference for a site
      And I enter the grid reference for another 29 sites
      Then I am shown the multiple site registration charge summary
      And I can see the total charge is £143576.00

@multiple @farm
  Scenario: All exemptions chosen for multiple site registration on a farm
    Given I confirm my waste activities are "on" a farm
      And I enter my business details
      And I select all exemptions from the list
      And I choose to add waste exemptions that are not included in the farming exemptions
      And I select all waste activities
      And I select all exemptions from the list
      And I confirm my waste exemption selections
      And I confirm my exemption is for multiple sites
      And I enter the grid reference for a site
      And I enter the grid reference for another 29 sites
      Then I am shown the multiple site registration charge summary