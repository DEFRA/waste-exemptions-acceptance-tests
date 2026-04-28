Feature: Card payment status

  Scenario: Submitted govPay response completes user registration RUBY-3835
    Given mocking is "enabled"
      And the govPay payment status is "submitted"
      And I start a new waste exemption registration
      And I select waste activity "We use waste in building and construction"
      And I select exemption "U3" from the activities list 
      And I confirm my waste exemption selections
      And I enter my location for the site
      And I confirm my waste activities are "not on" a farm
      And I confirm my organisation is not a charity
      And I confirm the charge summary
      And I enter my business details for a "partnership"
      And I enter the registration details
      And I confirm the registration details
     When I pay by card
     Then I will see a registration confirmation
     And I will receive a registration confirmation email