@backoffice @data @search
Feature: Back office users need to be able to search for registrations
  As a back office user
  I need to search for submitted and in progress registrations
  So that I can support both internal and external users and carry out my duties

  Background:
	  Given I sign in as an admin agent

  Scenario: Submitted registrations
     When The "submitted" search filter is selected
      And I search for "Mr Waste"
     Then I see "Mr Waste submitted" in the results
      But I don't see "Mr Waste unsubmitted"
      And refreshing doesn't create new registrations

  Scenario: [RUBY-66] Confirmation letter and refresh
     When The "submitted" search filter is selected
      And I search for "a known registration"

  Scenario: Unsubmitted registrations
     When The "unsubmitted" search filter is selected
      And I search for "Mr Waste"
     Then I see "Mr Waste unsubmitted" in the results
      But I don't see "Mr Waste submitted"
