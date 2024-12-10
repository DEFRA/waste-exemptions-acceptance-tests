@beta
Feature: Payment administration

Background: Private beta registration opting to pay by bank transfer
    Given I am participating in the private beta
     When I select waste activity "We use waste in building and construction"
      And I select exemption "U1" from the activities list
      And I confirm my waste exemption selections
      And I enter the registration details
     When I choose to pay by bank transfer
      And I will see a registration pending payment confirmation

Scenario: Recording bank transfer payment to registration
    Given I sign in as an admin agent
      And I find the payment details for the registration
     When I record a bank transfer payment for the registraton amount
     Then the balance will be zero

Scenario: Overpayment of registration charge refund can be recorded
    Given I sign in as an admin agent
      And I find the payment details for the registration
      And I record a bank transfer payment for more than the registration amount
     When I record a refund of the overpayment
    Then the balance will be zero