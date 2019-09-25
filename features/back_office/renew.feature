@backoffice @renew
Feature: [RUBY-241] Back office user carries out a renewal
  As an admin agent
  I need to renew on behalf of an assisted digital user
  So that our data is up to date

  # This feature will only work on test, or environments where renewals can be done instantly.
  # Immediate renewals require the environment variable RENEWAL_WINDOW_BEFORE_EXPIRY_IN_DAYS=1096

  Background: Register an exemption
    Given my business is a "limited_company"
     When I register an exemption
     Then I will be informed the registration is complete

    Given I sign in as a super agent

  Scenario: Renew a registration from back office without changes
     When I search for a registration to renew
      And I renew the registration "without" changes
     Then I can see the correct renewed details
      And I cannot renew it again from the back office

  Scenario: Renew a registration from back office with changes
     When I search for a registration to renew
      And I renew the registration "with" changes
     Then I can see the correct renewed details
      And I cannot renew it again from the back office

  Scenario: Check the renewal letter for assisted digital users
     When I view the renewal letter
     Then the renewal letter has the correct details

  Scenario: Cancel renewal
     When I search for a registration to renew
      And I partially renew the registration
     Then I can resume the renewal from where I left off
