@beta
Feature: Registration payments using card or bank transfer
@card
Scenario: Succesful payment for registration using card
    Given I am participating in the private beta
      And I select waste activity "We use waste in building and construction"
      And I select exemption "U1" from the activities list 
      And I confirm my waste exemption selections
      And I enter the registration details
     When I pay by card
     Then I will see a registration confirmation
@bacs
Scenario: Succesful registration by bank transfer after refused card payment
    Given I am participating in the private beta
     When I select waste activity "We use waste in building and construction"
      And I select exemption "U1" from the activities list 
      And I confirm my waste exemption selections
      And I enter the registration details
      But I have my credit card payment rejected
     When I choose to pay by bank transfer
     Then I will see a registration pending payment confirmation
    
