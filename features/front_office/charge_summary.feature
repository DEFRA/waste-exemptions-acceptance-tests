@frontoffice @charging
Feature: Charge summary 

As a user I want to see a breakdown of the charges for the exemptions I have chosen

Background:
    Given I start a new waste exemption registration

Scenario: Single band one U1 exemption charges £476
    Given I enter my business details
     When I select waste activity "We use waste in building and construction"
      And I select exemption "U1" from the activities list
      And I confirm my waste exemption selections
      And I enter my location for the site
      And I confirm my waste activities are "not on" a farm
     Then I can see the registration charge is £56
      And I can see the total charge is £476

Scenario: Multiple exemptions of the same band one have discounted exemptions
    Given I enter my business details
     When I select waste activity "We use waste in manufacturing or for a specified purpose"
      And I select waste activity "We sort, blend and recover waste"
      And I select waste activity "We store waste"
      And I select exemption "U9 T12 S1" from the activities list
      And I confirm my waste exemption selections
      And I enter my location for the site
      And I confirm my waste activities are "not on" a farm
     Then I can see the registration charge is £56
      And I can see the total charge is £628

Scenario: Multiple exemptions of different bands 1, 2 and 3
    Given I enter my business details
     When I select waste activity "We sort, blend and recover waste"
      And I select waste activity "We chemically treat, wash waste or use anaerobic digestion"
      And I select exemption "T10 T12 T16 T18" from the activities list
      And I confirm my waste exemption selections
      And I enter my location for the site
      And I confirm my waste activities are "not on" a farm
     Then I can see the registration charge is £56
      And I can see the total charge is £658

Scenario: Multiple exemptions of different bands 1, 2, 3 and 4
    Given I enter my business details
     When I select waste activity "We crush, bale, shred or chip waste"
      And I select waste activity "We store waste"
      And I select waste activity "We burn plant and wood waste"
      And I select waste activity "We deposit spoil, sanitary and plant matter waste"
      And I select exemption "T8 S1 D1 D8" from the activities list
      And I confirm my waste exemption selections
      And I enter my location for the site 
      And I confirm my waste activities are "not on" a farm
     Then I can see the registration charge is £56
      And I can see the total charge is £1474

@farm
Scenario: Farming waste exemptions are charged the farming compliance change
    Given I enter my business details
      And I select waste activity "We use waste in building and construction"
      And I select waste activity "We treat waste using a wormery or by composting"
      And I select exemption "U1 T23" from the activities list 
      And I confirm my waste exemption selections
      And I enter my location for the site
      And I confirm my waste activities are "on" a farm
     Then I can see the registration charge is £56
      And I can see the total charge is £144
@farm
  Scenario: Farming waste exemptions less than farming compliance charge are charged the lesser amount
    Given I enter my business details
      And I select waste activity "We spread or mix waste"
      And I select exemption "U13" from the activities list 
      And I confirm my waste exemption selections
      And I enter my location for the site
      And I confirm my waste activities are "on" a farm
     Then I can see the registration charge is £56
      And I can see the total charge is £86
      
  @farm
  Scenario: Farming and upper band non farming waste exemptions can be chosen together
    Given I enter my business details
     When I select waste activity "We crush, bale, shred or chip waste"
      And I select waste activity "We treat waste using a wormery or by composting"
      And I select exemption "T9 T23" from the activities list
      And I confirm my waste exemption selections
      And I enter my location for the site
      And I confirm my waste activities are "on" a farm
     Then I can see the registration charge is £56
      And I can see the total charge is £1380
      
  @farm
  Scenario: Farming and band 1 non farming waste exemptions can be chosen together
    Given I enter my business details
     When I select waste activity "We use waste in manufacturing or for a specified purpose"
      And I select waste activity "We treat waste using a wormery or by composting"
      And I select exemption "U9 T23" from the activities list
      And I confirm my waste exemption selections
      And I enter my location for the site
      And I confirm my waste activities are "on" a farm
     Then I can see the registration charge is £56
      And I can see the total charge is £564
  
  @farm
  Scenario: Farming and band 2 non farming waste exemptions can be chosen together
    Given I enter my business details
     When I select waste activity "We use waste in building and construction"
      And I select waste activity "We spread or mix waste"
      And I select waste activity "We burn plant and wood waste"
      And I select exemption "U2 U13 D6 D7" from the activities list
      And I confirm my waste exemption selections
      And I enter my location for the site
      And I confirm my waste activities are "on" a farm 
     Then I can see the registration charge is £56
      And I can see the total charge is £356

 @farm
  Scenario: Farming and band 3 non farming waste exemptions can be chosen together
    Given I enter my business details
      And I choose to add waste exemptions that are not included in the farming exemptions
      And I select waste activity "We use effluent or sludge"
      And I select waste activity "We spread or mix waste"
      And I select waste activity "We burn plant and wood waste"
      And I select exemption "U7 U13 D6 D7" from the activities list
      And I confirm my waste exemption selections
      And I enter my location for the site
      And I confirm my waste activities are "on" a farm
     Then I can see the registration charge is £56
      And I can see the total charge is £174

  @farm
  Scenario: Farming and band 2 non farming waste exemptions can be chosen together
    Given I enter my business details
     When I select waste activity "We use waste in building and construction"
      And I select waste activity "We spread or mix waste"
      And I select waste activity "We burn plant and wood waste"
      And I select exemption "U2 U13 D6 D7" from the activities list
      And I confirm my waste exemption selections
      And I enter my location for the site
      And I confirm my waste activities are "on" a farm
     Then I can see the registration charge is £56
      And I can see the total charge is £356
      
  @farm
  Scenario: Choosing all exemptions from waste exemptions list with farming discount
    Given I enter my business details
      And I select all waste activities
      And I select all exemptions from the list
      And I confirm my waste exemption selections
      And I enter my location for the site
      And I confirm my waste activities are "on" a farm
     Then I can see the registration charge is £56
      And I can see the total charge is £4004
  
  Scenario: Choosing all exemptions from waste exemptions list
    Given I enter my business details
      And I select all waste activities
      And I select all exemptions from the list
      And I confirm my waste exemption selections
      And I enter my location for the site
      And I confirm my waste activities are "not on" a farm
     Then I can see the registration charge is £56
      And I can see the total charge is £4840

  Scenario: Reviewing and selecting same exemption does not duplicate charge
    Given I enter my business details for a "limited_company"
      And I select waste activity "We use waste in manufacturing or for a specified purpose"
      And I select exemption "U9" from the activities list
      But I choose I want to change the exemptions I’ve selected
      And I select waste activity "We use waste in manufacturing or for a specified purpose"
      And I select exemption "U9" from the activities list
      And I confirm my waste exemption selections
      And I enter my location for the site
      And I confirm my waste activities are "not on" a farm
     Then I can see the registration charge is £56
      And I can see the total charge is £476

  Scenario: Choosing multiple exemptions including a band 3 exemption does not indicate a discounted band 3 charge
    Given I enter my business details for a "limited_company"
     When I select waste activity "We use waste in building and construction"
      And I select waste activity "We burn plant and wood waste"
      And I select exemption "U1 D7" from the activities list
      And I confirm my waste exemption selections
      And I enter my location for the site
      And I confirm my waste activities are "not on" a farm
     Then I can see the registration charge is £56
      And I can see the total charge is £506
      But I should not see a discounted charge applied

  @multiple
  Scenario: Charge summary for multiple site registration with 30 sites
    Given I enter my business details
     When I select waste activity "We use waste in manufacturing or for a specified purpose"
      And I select waste activity "We sort, blend and recover waste"
      And I select waste activity "We store waste"
      And I select exemption "U9 T12 S1" from the activities list
      And I confirm my waste exemption selections
      And I confirm my exemption is for multiple sites
      And I enter the grid reference for a site
      And I enter the grid reference for another 31 sites
      And I confirm I have added all my sites
      And I confirm my waste activities are "not on" a farm
     Then I am shown the multiple site registration charge summary
      And I can see the registration charge is £56
      And I can see the total charge is £18360

@farm @multiple
  Scenario: Farming waste exemptions less than farming compliance registered for multiple sites
    Given I enter my business details
      And I select waste activity "We spread or mix waste"
      And I select exemption "U13" from the activities list 
      And I confirm my waste exemption selections
      And I confirm my exemption is for multiple sites
      And I enter the grid reference for a site
      And I enter the grid reference for another 29 sites
      And I confirm I have added all my sites
      And I confirm my waste activities are "on" a farm
     Then I am shown the multiple site registration charge summary
      And I can see the registration charge is £56
      And I can see the total charge is £956
      
  @farm @multiple
  Scenario: Farming waste exemptions are charged the farming compliance change registered for multiple sites
    Given I enter my business details
      And I select waste activity "We use waste in building and construction"
      And I select exemption "U1" from the activities list 
      And I confirm my waste exemption selections
      And I confirm my exemption is for multiple sites
      And I enter the grid reference for a site
      And I enter the grid reference for another 29 sites
      And I confirm I have added all my sites
      And I confirm my waste activities are "on" a farm
     Then I am shown the multiple site registration charge summary
      And I can see the registration charge is £56
      And I can see the total charge is £2696

@multiple 
Scenario: All exemptions chosen for multiple site registration
    Given I enter my business details
      And I select all waste activities
      And I select all exemptions from the list
      And I confirm my waste exemption selections
      And I confirm my exemption is for multiple sites
      And I enter the grid reference for a site
      And I enter the grid reference for another 29 sites
      And I confirm I have added all my sites
      And I confirm my waste activities are "not on" a farm
     Then I am shown the multiple site registration charge summary
      And I can see the total charge is £143576
@t28
  Scenario: Charge summary: Registration with only a T28 exemption is not charged
    Given I enter my business details for a "limited_company"
      And I select waste activity "We sort, blend and recover waste"
      And I select exemption "T28" from the activities list
      And I confirm my waste exemption selections
      And I enter my location for the site
      And I confirm my waste activities are "not on" a farm
      And I can see the registration charge is £0
      And I can see the total charge is £0