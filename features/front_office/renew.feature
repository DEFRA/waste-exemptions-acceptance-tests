@email
@frontoffice @renew @renewf 
Feature: [RUBY-241] Front office user renews a registration via email
  As a waste operator
  I need to renew my waste exemption
  So that I can continue my waste activities

  # This feature will only work on environments which allow instant renewals.
  # This requires the environment variable RENEWAL_WINDOW_BEFORE_EXPIRY_IN_DAYS=1096

  Background: Register an exemption and get renewal email
    Given I have a valid registration
      And I receive an invitation to renew
      And I click the link in the renewal email

  Scenario: Renew a registration from email without changes
     And I renew the registration "without" changes
      And I receive a renewal confirmation email
      And I cannot renew it again
  @smoke
  Scenario: Renew a registration from email with changes
     When I renew the registration "with" changes
      And I receive a renewal confirmation email
      And I cannot renew it again
  
  Scenario: Deselecting all exemptions on renewal prompts user to stop renewal
    When I choose to remove all my exemptions
    Then I will be informed I need to select an exemption