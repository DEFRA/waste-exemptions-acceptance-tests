@frontoffice @charging @email
Feature: Registration payments using card or bank transfer

Background: Create registration
    Given I start a new waste exemption registration
@card
  Scenario: Succesful payment for registration using card
    Given I enter my business details for a "partnership"
      And I select waste activity "We use waste in building and construction"
      And I select exemption "U1" from the activities list 
      And I confirm my waste exemption selections
      And I enter my location for the site
      And I confirm my waste activities are "not on" a farm
      And I confirm my organisation is not a charity
      And I confirm the charge summary
      And I enter the registration details
      And I confirm the registration details
     When I pay by card
     Then I will see a registration confirmation
      And I will receive a registration confirmation email

@bacs
  Scenario: Succesful registration by bank transfer
    Given I enter my business details for a "limited_company"
      And I select waste activity "We crush, bale, shred or chip waste"
      And I select waste activity "We store waste"
      And I select waste activity "We burn plant and wood waste"
      And I select waste activity "We deposit spoil, sanitary and plant matter waste"
      And I select exemption "T8 S1 D1 D8" from the activities list
      And I confirm my waste exemption selections
      And I enter my location for the site
      And I confirm my waste activities are "not on" a farm
      And I confirm my organisation is not a charity
      And I confirm the charge summary
      And I enter the registration details
      And I confirm the registration details
     When I choose to pay by bank transfer
     Then I will see a registration received pending payment confirmation
      And I will receive a registration received pending payment email

  
  Scenario: Charititable purpose exemptions are not charged
     When I enter my business details for a "charity"
      And I select waste activity "We store waste"
      And I select exemption "S1" from the activities list
      And I confirm my waste exemption selections
      And I enter my location for the site
      And I confirm my waste activities are "not on" a farm
      And I confirm my organisation is a charity
      And I confirm the charge summary
      And I enter the registration details
      And I confirm the registration details
     Then I will see a registration confirmation
      And I will receive a registration confirmation email

@smoke @multiple @card
  Scenario: Multiple site registration
    Given I enter my business details
     When I select waste activity "We use waste in manufacturing or for a specified purpose"
      And I select waste activity "We sort, blend and recover waste"
      And I select waste activity "We store waste"
      And I select exemption "U9 T12 S1" from the activities list
      And I confirm my waste exemption selections
      And I confirm my exemption is for multiple sites
      And I enter the grid reference for a site
      And I enter the grid reference for another 29 sites
      And I confirm I have added all my sites
      And I confirm my waste activities are "not on" a farm
      And I confirm my organisation is not a charity
     Then I confirm the charge summary
      And I enter the registration details
      And I confirm the registration details
     When I pay by card
     Then I will see a registration confirmation
      And I will receive a registration confirmation email

@t28
  Scenario: Registration with only a T28 exemption is not charged
    Given I enter my business details for a "limited_company"
      And I select waste activity "We sort, blend and recover waste"
      And I select exemption "T28" from the activities list
      And I confirm my waste exemption selections
      And I enter my location for the site
      And I confirm my waste activities are "not on" a farm
      And I confirm my organisation is not a charity
      And I confirm the charge summary
      And I enter the registration details
      And I confirm the registration details
     Then I will see a registration confirmation
      And I will receive a registration confirmation email

  @smoke @multiple
  Scenario: Multiple site T28 no charge registration
    Given I enter my business details
     When I select waste activity "We sort, blend and recover waste"
      And I select exemption "T28" from the activities list
      And I confirm my waste exemption selections
      And I confirm my exemption is for multiple sites
      And I enter the grid reference for a site
      And I enter the grid reference for another 29 sites
      And I confirm I have added all my sites
      And I confirm my waste activities are "not on" a farm
      And I confirm my organisation is not a charity
     Then I confirm the charge summary
      And I enter the registration details
      And I confirm the registration details
     Then I will see a registration confirmation
      And I will receive a registration confirmation email