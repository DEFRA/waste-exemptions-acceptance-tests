@mvp @ad @email
Feature: Assisted digital charged registrations

Background: Create registration and sign into back office
    Given I sign in as an admin team user
      And I start an assisted digital registration
@card
Scenario: Succesful payment for registration using card
    Given I confirm my waste activities are "not on" a farm
      And I enter my business details
      And I select waste activity "We use waste in building and construction"
      And I select exemption "U1" from the activities list 
      And I confirm my waste exemption selections
      And I enter the registration details
      And I confirm the registration details
      And I confirm the charge summary
     When I pay by card
     Then I will see a registration confirmation
     And I will receive a registration confirmation email
@bacs
Scenario: Succesful registration by bank transfer
    Given I confirm my waste activities are "on" a farm
      And I enter my business details
      And I select exemptions "U13 D6 D7" from the "farming" list
      And I choose to add waste exemptions that are not included in the farming exemptions
      And I select waste activity "We use effluent or sludge"
      And I select exemption "U7" from the activities list
      And I confirm my waste exemption selections
      And I enter the registration details
      And I confirm the registration details
      And I confirm the charge summary
     When I choose to pay by bank transfer
     Then I will see a registration received pending payment confirmation
      And I will receive a registration received pending payment email
    
