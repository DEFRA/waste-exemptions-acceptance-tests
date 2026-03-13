@prod_smoke
Feature: End to end smoke test of front and back office

Scenario: Front office registration and deregistration in the back office
    Given I start a new waste exemption registration
      And I select waste activity "We crush, bale, shred or chip waste"
      And I select waste activity "We store waste"
      And I select waste activity "We burn plant and wood waste"
      And I select waste activity "We deposit spoil, sanitary and plant matter waste"
      And I select exemption "T8 S1 D1 D8" from the activities list
      And I confirm my waste exemption selections
      And I enter my location for the site
      And I confirm my waste activities are "not on" a farm
      And I confirm my organisation is not a charity
      And I confirm the charge summary
      And I enter my business details for a "individual"
      And I enter the registration details
      And I confirm the registration details
     When I choose to pay by bank transfer
     Then I will see a registration received pending payment confirmation
    Given I sign in as an admin team user
     When I deregister a whole registration
     Then the registration is no longer active