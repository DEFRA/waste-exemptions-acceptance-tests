@backoffice @charging @ad @email
Feature: Assisted digital charged registrations

Background: Create registration and sign into back office
    Given I sign in as an admin team user
      And I start an assisted digital registration
@card
Scenario: Succesful payment for registration using card
    Given I enter my business details for a "llp"
      And I select waste activity "We use waste in building and construction"
      And I select exemption "U1" from the activities list 
      And I confirm my waste exemption selections
      And I enter my location for the site
      And I confirm my waste activities are "not on" a farm
      And I confirm the charge summary
      And I enter the registration details
      And I confirm the registration details
     When I pay by card
     Then I will see a registration confirmation
      And I will receive a registration confirmation email

@bacs
Scenario: Succesful registration by bank transfer
    Given I enter my business details for a "local_authority"
      And I select waste activity "We use effluent or sludge"
      And I select waste activity "We spread or mix waste"
      And I select waste activity "We burn plant and wood waste"
      And I select exemption "U7 U13 D6 D7" from the activities list
      And I confirm my waste exemption selections
      And I enter my location for the site
      And I confirm my waste activities are "on" a farm
      And I confirm the charge summary
      And I enter the registration details
      And I confirm the registration details
     When I choose to pay by bank transfer
     Then I will see a registration received pending payment confirmation
      And I will receive a registration received pending payment email
  
  Scenario: Charities can register by calling the Environment Agency
    Given I enter my business details for a "charity"
      And I select waste activity "We use waste in building and construction"
      And I select exemptions "U1 U2 U3" from the activities list
      And I confirm my waste exemption selections
      And I enter my location for the site
      And I confirm my waste activities are "not on" a farm
      And I confirm the charge summary
      And I enter the registration details
      And I confirm the registration details
     When I pay by card
     Then I will see a registration confirmation
      And I will receive a registration confirmation email
