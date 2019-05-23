@backoffice @data
Feature: Back office users need to be able to search for registrations
  As a back office user
  I need to search for submitted and in progress registrations
  So that I can support both internal and external users and carry out my duties

  Background:
	  Given I sign in as an admin agent

  Scenario: [RUBY-66] Confirmation letter
     When The "submitted" search filter is selected
      And I search for "a known registration"
     Then I can see a confirmation letter for a known registration

  Scenario: Submitted registrations
     When The "submitted" search filter is selected
      And I search for "Mr Waste"
     Then I see "Mr Waste submitted" in the results
      And I can see confirmation letter links
      But I don't see "Mr Waste unsubmitted"

  Scenario: Unsubmitted registrations
     When The "unsubmitted" search filter is selected
      And I search for "Mr Waste"
     Then I see "Mr Waste unsubmitted" in the results
      But I don't see "Mr Waste submitted"
      And I cannot see a confirmation letter
