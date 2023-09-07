@email @edit_link
Feature: Initiate edit/deregistration self-serve

 As a waste exemption holder
  I want to be able to enter my registration reference and email address
  So I receive a valid edit magic link by email
  If the reference and email address don't match, no email will be sent.

Scenario: Registration reference and email address do not match
  Given I have a registration "outside" of the renewal window
   When I start the flow to request an edit link
    And I enter an invalid combination of reference number and email address
   Then I will see the standard conditional confirmation page
    And I will not receive an edit link email

Scenario: Registration is not within the renewal window
  Given I have a registration "outside" of the renewal window
   When I start the flow to request an edit link
    And I enter a valid combination of reference number and email address
   Then I will see the standard conditional confirmation page
    And I will receive an edit link email

# Included for completeness. The email should be sent whether the registration is within the renewal window or not.
Scenario: Registration is within the renewal window
  Given I have a registration "inside" of the renewal window
   When I start the flow to request an edit link
    And I enter a valid combination of reference number and email address
   Then I will see the standard conditional confirmation page
   And I will receive an edit link email
