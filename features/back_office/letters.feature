@backoffice
Feature: Sending letters for registrations and renewals when no contact email is given

Background: Sign into back office
    Given I sign in as an admin team user

@letter
  Scenario: Registration in back office where no contact email is given user sends confirmation letter to contact
     When I complete an AD "limited_company" registration without an email address paying by "bank_transfer"
      And I will see a registration pending payment confirmation
     Then a payment by bank transfer letter has been sent

@letter @renew
  Scenario: Renewal in back office where no contact email is given user sends confirmation letter to contact
      When I complete an AD "limited_company" registration without an email address paying by "card"
      And I choose to renew a registration
      And I renew the registration "without" changes
      Then I will be informed the registration is complete
      And a registration confirmation letter has been sent