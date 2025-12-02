@backoffice @renew @renewb @email
Feature: [RUBY-241] Back office user carries out a renewal
   As an admin team user
   I need to renew on behalf of an assisted digital user
   So that our data is up to date

   This feature will only work on environments which allow instant renewals.
   This requires the environment variable RENEWAL_WINDOW_BEFORE_EXPIRY_IN_DAYS=1096.

   Background: Register an exemption
    Given I sign in as an admin team user
      And I start an assisted digital registration
      And I confirm my waste activities are "not on" a farm
      And I enter my business details for a "llp"
      And I select waste activity "We use waste in building and construction"
      And I select exemptions "U1 U2 U3" from the activities list
      And I confirm my waste exemption selections
      And I confirm my exemption is for a single site
      And I confirm the charge summary
      And I enter the registration details
      And I confirm the registration details
      And I pay by card
      And I will see a registration confirmation
      And I view a registration's sites information
        And I sign in as an admin team user

   Scenario: Renew a registration from back office without changes
      When I choose to renew a registration
       And I renew the registration "without" changes
      Then I receive a renewal confirmation email
@smoke
   Scenario: Renew a registration from back office with changes
      When I choose to renew a registration
       And I renew the registration "with" changes
      Then I receive a renewal confirmation email
      
