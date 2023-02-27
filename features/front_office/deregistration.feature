@email
Feature: Deregistration self-serve

As a waste exemption holder
I want to be able to remove any unwanted waste activity exemptions
So my registration is up to date and accurate

Scenario: Waste exemption holder can deregister all exemptions
 Given I have a registration outside of the renewal window
   And I choose to deregister exemptions from the email invite
  When I choose to deregister all current exemptions
   And I confirm to deregister all my exemptions
  Then I will see confirmation that my registration has be deregistered
   And I will receive a deregistration confirmation email

Scenario: Waste exemption holder can deregister an exemption
 Given I have a registration outside of the renewal window
   And I choose to deregister exemptions from the email invite
  When I choose to deregister an exemption
   And I confirm to deregister an exemption
  Then I will see confirmation that my exemption has be deregistered
   And I will receive a registration edit confirmation email