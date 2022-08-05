Feature: Sending letters for registrations and renewals when no contact email is given

Background: Sign into back office
    Given I sign in as an admin agent

@letter
  Scenario: Registration in back office where no contact email is given user sends confirmation letter to contact
     When I complete an assisted digital "limited_company" registration without an email address
     Then I will be informed the registration is complete
     And a registration confirmation letter has been sent

@letter
  Scenario: Renewal in back office where no contact email is given user sends confirmation letter to contact
      When I complete an assisted digital "limited_company" registration without an email address
      And I search for a registration to renew
      And I renew the registration "without" changes
      Then I will be informed the registration is complete
      And a registration confirmation letter has been sent