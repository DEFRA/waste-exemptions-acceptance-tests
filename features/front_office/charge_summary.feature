@frontoffice @beta
Feature: Charge summary 

As a user I want to see a breakdown of the charges for the exemptions I have chosen

# Note: will need feature toggle private_beta enabled

Scenario: Single band one U1 exemption charges £476
    Given I am participating in the private beta
     When I select waste activity "We use waste in building and construction"
     And I select exemption "U1" from the activities list
     And I confirm my waste exemption selections
     Then I can see the registration charge is £56.00
      And I can see the total charge is £476.00
      And I can see that the "Full" compliance charge of band 1 exemption is £420.00

Scenario: Multiple exemptions of the same band one have discounted exemptions
    Given I am participating in the private beta
    When I select waste activity "We use waste in manufacturing or for a specified purpose"
    And I select waste activity "We sort, blend and recover waste"
    And I select waste activity "We store waste"
    And I select exemption "U9 T12 S1" from the activities list
     And I confirm my waste exemption selections
     Then I can see the registration charge is £56.00
      And I can see the total charge is £628.00
      And I can see that the "Full" compliance charge of band 1 exemption is £20.00
      And I can see that the "Discounted" compliance charge of band 1 exemption is £76.00

Scenario: Multiple exemptions of different bands 1, 2 and 3
    Given I am participating in the private beta
    When I select waste activity "We sort, blend and recover waste"
     And I select exemption "T10 T12 T16 T28" from the activities list
      And I confirm my waste exemption selections
     Then I can see the registration charge is £56.00
      And I can see the total charge is £658.00
      And I can see that the "Full" compliance charge of band 1 exemption is £420.00
      And I can see that the "Discounted" compliance charge of band 3 exemption is £30.00


Scenario: Multiple exemptions of different bands 1, 2, 3 and 4
    Given I am participating in the private beta
     When I select waste activity "We crush, bale, shred or chip waste"
      And I select waste activity "We store waste"
      And I select waste activity "We burn plant and wood waste"
      And I select waste activity "We deposit spoil, sanitary and plant matter waste"
      And I select exemption "T8 S1 D1 D8" from the activities list
      And I confirm my waste exemption selections
     Then I can see the registration charge is £56.00
      And I can see the total charge is £1474.00
      And I can see that the "Full" compliance charge of band 4 exemption is £1236.00
      And I can see that the "Discounted" compliance charge of band 3 exemption is £30.00
