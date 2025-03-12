@charging
Feature: Payment administration

Background: Charging registration opting to pay by bank transfer
    Given I sign in as an admin team user
      And I start an assisted digital registration
      And I confirm my waste activities are "not on" a farm
      And I enter my business details
     When I select waste activity "We use waste in building and construction"
      And I select exemption "U1" from the activities list
      And I confirm my waste exemption selections
      And I enter the registration details
      And I confirm the registration details
      And I confirm the charge summary
     When I choose to pay by bank transfer
     Then I will see a registration received pending payment confirmation

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
      And I add a positive charge the full registration amount
     Then I will receive a registration confirmation email

Scenario: Overpayment of registration charge refund can be recorded
    Given I sign in as an admin team leader
      And I find the payment details for the registration
      And I record a bank transfer payment for more than the registration amount
     When I record a refund of the overpayment
     Then the balance will be zero

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