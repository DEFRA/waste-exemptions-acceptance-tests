@beta @ad
Feature: Assisted digital registrations

Background: Create registration and sign into back office
    Given I have a valid registration
      And I sign in as an admin team user
      And I start the assisted digital private beta registration
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
Scenario: Succesful registration by bank transfer after refused card payment
    Given I confirm my waste activities are "not on" a farm
      And I enter my business details
      And I select waste activity "We crush, bale, shred or chip waste"
      And I select waste activity "We store waste"
      And I select waste activity "We burn plant and wood waste"
      And I select waste activity "We deposit spoil, sanitary and plant matter waste"
      And I select exemption "T8 S1 D1 D8" from the activities list
      And I confirm my waste exemption selections
      And I enter the registration details
      And I confirm the registration details
      And I confirm the charge summary
     When I choose to pay by bank transfer
     Then I will see a registration confirmation
     And I will receive a registration confirmation email
    
