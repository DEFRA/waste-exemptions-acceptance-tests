Feature: No charge renewals

Background: Register an exemption and get renewal email
    Given I have a valid registration with a "T28" exemption
      And I receive an invitation to renew
      And I click the link in the renewal email
@t28
      Scenario: Renew a T28 registration from email without changes
        And I renew the registration "without" changes
        And I receive a renewal confirmation email
