@backoffice @data @search @broken
Feature: Back office users need to be able to search for registrations
  As a back office user
  I need to search for submitted and in progress registrations
  So that I can support both internal and external users and carry out my duties

  # This feature is broken because the @data tag no longer calls the before hook,
  # if running this test as part of a suite. However, running this test in isolation works.
  # RUBY-489 has been raised to fix this.

  Background:
	  Given I sign in as an admin agent

  Scenario: Submitted registrations
     When The "submitted" search filter is selected
      And I search for "Mr Waste"
     Then I see "Mr Waste submitted" in the results
      And I can see confirmation letter links

      But I don't see "Mr Waste unsubmitted"
      And refreshing doesn't create new registrations

  Scenario: [RUBY-66] Confirmation letter and refresh
     When The "submitted" search filter is selected
      And I search for "a known registration"
     Then I can see a confirmation letter for a known registration

  Scenario: Unsubmitted registrations
     When The "unsubmitted" search filter is selected
      And I search for "Mr Waste"
     Then I see "Mr Waste unsubmitted" in the results
      But I don't see "Mr Waste submitted"
      And I cannot see a confirmation letter
