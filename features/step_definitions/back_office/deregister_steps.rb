# frozen_string_literal: true

When(/^I "([^"]*)" an exemption$/) do |status|

  @app.search_page.nav_bar.home_link.click

  @app.search_page.search_field.set @exemption_number
  @app.search_page.search_button.click

  @app.search_page.first_search_result.click

  @app.registration_page.exemption_details.expander_link.click
  @app.registration_page.exemption_details.first_deregister_btn.click

  @app.deregister_exemption_page.submit(
    reason: status.to_sym,
    comment: "This is a test"
  )

end

Then(/^When I "([^"]*)" the last active exemption$/) do |status|

  @app.search_page.nav_bar.home_link.click

  @app.search_page.search_field.set @exemption_number
  @app.search_page.search_button.click

  @app.search_page.first_search_result.click

  @app.registration_page.exemption_details.expander_link.click
  @app.registration_page.exemption_details.last_deregister_btn.click

  @app.deregister_exemption_page.submit(
    reason: status.to_sym,
    comment: "This is a test"
  )

end

Then(/^I can see the exemption is "([^"]*)"$/) do |status|

  expect(@app.registration_page.exemption_details.first_exemption_status.text).to eq(status)

end

Then(/^I can see all exemptions are "([^"]*)"$/) do |status|

  expect(@app.registration_page.exemption_details.first_exemption_status.text).to eq(status)
  expect(@app.registration_page.exemption_details.last_exemption_status.text).to eq(status)

end

Then(/^I can also see the registration is "([^"]*)"$/) do |status|

  expect(@app.registration_page.registration_details.status.text).to eq(status)

end

When(/^I "([^"]*)" the registration$/) do |status|

  @app.search_page.nav_bar.home_link.click

  @app.search_page.search_field.set @exemption_number
  @app.search_page.search_button.click

  @app.search_page.first_search_result.click

  @app.registration_page.deregister_btn.click

  @app.deregister_registration_page.submit(
    reason: status.to_sym,
    comment: "This is a test"
  )

  # We have to ensure that the exemption details section is expanded ready for
  # the next step 'I can see the exemption is "ceased/revoked" as it is a multi
  # use step that assumes the section has already been expanded. Where it's used
  # by scenarios that deregister an exemption, the section would have already
  # been toggled visible. When deregistering the registration this is not the
  # case hence we include it here in preparation for the next step.
  @app.registration_page.exemption_details.expander_link.click

end
