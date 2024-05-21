Feature: Check your answers changes

Scenario: User can change contact name from check your answers page
      Given my business is a "limited_company"
      And I start a new waste exemption registration
      And I register choosing to reuse my business information previously entered
      And I am on the check your answers page
      When I change the contact name previously entered
      Then I can see the contact name has been updated
