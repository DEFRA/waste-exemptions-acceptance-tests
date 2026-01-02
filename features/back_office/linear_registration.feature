@linear
Feature: Linear registrations in the back office

Scenario: Linear registration via assisted digital
      Given I sign in as an admin team user
        And I start an assisted digital registration
        And I confirm my waste activities are "not on" a farm
        And I enter my business details for a "limited_company"
        And I select waste activity "We use waste in building and construction"
        And I select exemption "U1" from the activities list
        And I confirm my waste exemption selections
        And I confirm my exemption is for a single site
        And I confirm the charge summary
        And I enter the grid reference for the linear site
        And I enter the registration details
        And I confirm the registration details
       When I pay by card
       Then I will see a registration confirmation
        And I will see an indication that the registration is for a linear exemption on the registration details page
        And I can view linear registration's details from the linear registrations list