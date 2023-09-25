@backoffice
Feature: Back office registration actions

    Actions that can be carried out on a registration in the back office

    Background: Create registration and sign into back office
      Given a registration has been created
      And I sign in as a super agent

    Scenario: Renewal reminder letter can be resent from registration details page
      When I search for the registration
      And I view the registration details
      And I resend the renewal reminder letter  
      Then I will see a confirmation the renewal reminder letter has been sent
      And a renewal reminder letter has been sent

   Scenario: Confirmation letter can be resent from registration details page
      When I search for the registration
      And I view the registration details
      And I resend the confirmation letter
      Then I will see the registration confirmation letter has been sent
      And a registration confirmation letter has been sent

  Scenario: Confirmation email can be resent from registration details page
      When I search for the registration
      And I view the registration details
      And I resend the confirmation email
      Then I will see the registration confirmation email has been sent
      And I will receive a registration confirmation email

  Scenario: Communication history can be accessed from registration details page
      When I search for the registration
      And I view the registration details
      And I open communication history
      Then I can see the communication logs on the communication history page
