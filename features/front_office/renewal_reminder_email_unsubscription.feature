Feature: Users can unsubscribe from renewal reminder emails

Background: 
    Given I have a valid registration
      And I search for the registration
      And I view the registration details

Scenario: User can unsubscibe from renewal reminder emails in confirmation email
     When I resend the confirmation email
      And I choose to unsubscribe from renewal reminders
     Then I will see confirmation that I have unsubscibed
      And the unsubscription is logged in the communications history

Scenario: User can unsubscibe from renewal reminder emails in renewal invite email
     When I resend the renewal invite email
      And I choose to unsubscribe from renewal reminders
     Then I will see confirmation that I have unsubscibed
      And the unsubscription is logged in the communications history