@frontoffice @beta

Feature: Charge summary 

As a user I want to see a breakdown of the charges for the exemptions I have chosen

# Note: will need feature toggle private_beta enabled

Scenario: Single band one U1 exemption charges £450
    Given I am participating in the private beta
     When I select exemption "U1"
     Then I can see the registration charge is £41.00
      And I can see the total charge is £450.00
      And I can see that the "Full" compliance charge of band 1 exemption "U1" is £409.00

Scenario: Multiple exemptions of the same band one have discounted exemptions
    Given I am participating in the private beta
     When I select exemption "U9 T12 S1"
     Then I can see the registration charge is £41.00
      And I can see the total charge is £598.00
      And I can see that the "Full" compliance charge of band 1 exemption "T12" is £409.00
      And I can see that the "Discounted" compliance charge of band 1 exemption "U9" is £74.00

Scenario: Multiple exemptions of different bands 1, 2 and 3
    Given I am participating in the private beta
     When I select exemption "T10 T12 T16 T28"
     Then I can see the registration charge is £41.00
      And I can see the total charge is £628.00
      And I can see that the "Full" compliance charge of band 1 exemption "T10" is £409.00
      And I can see that the "Discounted" compliance charge of band 3 exemption "T28" is £30.00


Scenario: Multiple exemptions of different bands 1, 2, 3 and 4
    Given I am participating in the private beta
     When I select exemption "T8 S1 D1 D8"
     Then I can see the registration charge is £41.00
      And I can see the total charge is £1399.00
      And I can see that the "Full" compliance charge of band 4 exemption "T8" is £1180.00
      And I can see that the "Discounted" compliance charge of band 3 exemption "D8" is £30.00
