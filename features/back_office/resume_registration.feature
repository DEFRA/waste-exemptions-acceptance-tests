@backoffice @data @resume @broken
Feature: Back office user resumes assisted digital registration for a user
  As a super agent
  I need to complete a user's registration
  So that they know their exemption is complete.

  # This feature is broken because the @data tag no longer calls the before hook,
  # if running this test as part of a suite. However, running this test in isolation works.
  # RUBY-489 has been raised to fix this.

  Scenario: Complete a registration on behalf of an external user
    Given I sign in as a super agent
     When I complete an in progress registration
     Then I can find and edit the registration I just submitted
