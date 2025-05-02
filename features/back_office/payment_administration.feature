@charging
Feature: Payment administration

Background: Create a registration
    Given I have a valid registration

Scenario: Recording full bank transfer payment to registration sends confirmation email
    Given I sign in as a finance user
      And I find the payment details for the registration
     When I record a bank transfer payment for the registration amount
     Then the balance will be zero
     And I will receive a registration confirmation email

Scenario: Overpayment bank transfer payment to registration sends confirmation email
    Given I sign in as an admin team leader
      And I find the payment details for the registration
      And I record a bank transfer payment for more than the registration amount
     Then I will receive a registration confirmation email

Scenario: Charge adjustment of registration to sends confirmation email
    Given I sign in as an admin team user
      And I find the payment details for the registration
      And I add a positive charge of the full registration amount
     Then I will receive a registration confirmation email

@refund
Scenario: Overpayment of registration charge refund can be recorded
    Given I sign in as an admin team leader
      And I find the payment details for the registration
      And I record a bank transfer payment for more than the registration amount
     When I record a refund of the overpayment
     Then the balance will be zero
     
@refund
Scenario: Partial refund of registration charge can be recorded
    Given I sign in as an admin team leader
      And I find the payment details for the registration
      And I record a bank transfer payment for more than the registration amount
     When I record a partial refund of half of the overpayment
     Then I record a partial refund of half of the overpayment
      And the balance will be zero

Scenario: Incorrect payment entry can be reversed
    Given I sign in as an admin team user
      And I find the payment details for the registration
      But I record a bank transfer payment for more than the registration amount
     When I reverse the payment
     Then the total charge amount is owed

Scenario: Charge adjustment can be added to a registration to put it in credit
    Given I sign in as an admin team user
      And I find the payment details for the registration
      And I record a bank transfer payment for the registration amount
     When I add a positive charge of £10.00 to the registration
     Then I can see the registration is £10.00 in credit