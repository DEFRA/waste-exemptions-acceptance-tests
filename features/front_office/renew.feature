@frontoffice @renew
Feature: [RUBY-241] Front office user renews a registration via email
  As a waste operator
  I need to renew my waste exemption
  So that I can continue my waste activities

  # This feature will only work on the test environment, where renewals can be done instantly.

  Background: Register an exemption and get renewal email
    Given my business is a "limited_company"
     When I register an exemption
     Then I will be informed the registration is complete

      And I receive an invitation to renew
      And I click the link in the renewal email

  Scenario: Renew a registration from email without changes
     When I renew the registration "without" changes
     Then I can see the correct renewed details
      And I receive a renewal confirmation email
      And I click the link in the renewal email
      And I cannot renew it again

  Scenario: Renew a registration from email with changes
     When I renew the registration "with" changes
     Then I can see the correct renewed details
      And I receive a renewal confirmation email
      And I click the link in the renewal email
      And I cannot renew it again

  Scenario: Cancel renewal
     When I partially renew the registration
     Then I can resume the renewal from where I left off
