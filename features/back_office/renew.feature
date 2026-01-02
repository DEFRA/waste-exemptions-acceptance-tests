@backoffice @renew @renewb @email
Feature: [RUBY-241] Back office user carries out a renewal
   As an admin team user
   I need to renew on behalf of an assisted digital user
   So that our data is up to date

   This feature will only work on environments which allow instant renewals.
   This requires the environment variable RENEWAL_WINDOW_BEFORE_EXPIRY_IN_DAYS=1096.

 Background: Register an exemption
     Given I have a valid registration
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
      
