Feature: Payment administration

Background: Private beta registration opting to pay by bank transfer
    Given I am participating in the private beta
      And I select exemption "U1"
      And I enter the registration details
     When I choose to pay by bank transfer
      And I will see a registration pending payment confirmation

Scenario: Recording bank transfer payment to registration
    Given I sign in as an admin agent
      And I find the payment details for the registration
     When I record a bank transfer payment for the registraton amount
    #  Then the balance will be zero