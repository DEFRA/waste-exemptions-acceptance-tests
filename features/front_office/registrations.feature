@charging @email
Feature: Registration payments using card or bank transfer

Background: Create registration and sign into back office
    Given I start a new waste exemption registration
@card
Scenario: Succesful payment for registration using card
    Given I confirm my waste activities are "not on" a farm
      And I enter my business details for a "partnership"
      And I select waste activity "We use waste in building and construction"
      And I select exemption "U1" from the activities list 
      And I confirm my waste exemption selections
      And I confirm the charge summary
      And I enter the registration details
      And I confirm the registration details
     When I pay by card
     Then I will see a registration confirmation
     And I will receive a registration confirmation email
@bacs
Scenario: Succesful registration by bank transfer
    Given I confirm my waste activities are "not on" a farm
      And I enter my business details for a "limited_company"
      And I select waste activity "We crush, bale, shred or chip waste"
      And I select waste activity "We store waste"
      And I select waste activity "We burn plant and wood waste"
      And I select waste activity "We deposit spoil, sanitary and plant matter waste"
      And I select exemption "T8 S1 D1 D8" from the activities list
      And I confirm my waste exemption selections
      And I confirm the charge summary
      And I enter the registration details
      And I confirm the registration details
     When I choose to pay by bank transfer
     Then I will see a registration received pending payment confirmation
      And I will receive a registration received pending payment email
    
@farm
Scenario: All chosen farming exemptions can not be chosen from the non farming exemptions list
    Given I confirm my waste activities are "on" a farm
      And I enter my business details
      And I select exemptions "U1 U14 D6 D7 T23" from the "farming" list
      And I choose to add waste exemptions that are not included in the farming exemptions
      And I select all waste activities
     Then my farming exemptions are not available to be chosen from the list

@farm
  Scenario: Non farming exemptions can be chosen for an on farm registration
    Given I confirm my waste activities are "on" a farm
      And I enter my business details
     When I select no exemptions from the list
      And I choose to add waste exemptions that are not included in the farming exemptions
     Then I can select waste activities from the list  
@farm
  Scenario: On farm registrant informed to pick exemptions when no exemptions are chosen 
    Given I confirm my waste activities are "on" a farm
      And I enter my business details
     When I select no exemptions from the list
      But I confirm I do not want any more waste exemptions
     Then I am told I can not continue without adding exemptions

  Scenario: Charities are requested to call the Environment Agency to register
    Given I confirm my waste activities are "not on" a farm
      When I select that I am registering as a charity
      Then I am told to call the Environment Agency to register
