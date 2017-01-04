When(/^I revoke a registration$/) do

  @app.search_page.nav_bar.home_link.click

  @app.search_page.search_field.set @exemption_number
  @app.search_page.search_button.click

  @app.search_page.first_search_result.click

  @app.registration_details_page.deregister.click

    @app.registration_deregistration_page.submit(
    reason: :revoke,
    registration_deregistration_comment: "This is a test"
  )
end

When(/^I cease a registration$/) do

  @app.search_page.nav_bar.home_link.click

  @app.search_page.search_field.set @exemption_number
  @app.search_page.search_button.click

  @app.search_page.first_search_result.click

  @app.registration_details_page.deregister.click

  @app.registration_deregistration_page.deregister_registration(
    reason: :cease,
    registration_deregistration_comment: "This is a test"
  )
end

Then(/^I will be informed the registration is deregistered$/) do

  expect(@app.registration_details_page.text).to include("Enrollment deregistered successfully")

  @app.search_page.nav_bar.sign_out_link.click

end

When(/^I deregister an exemption$/) do
  @app.search_page.nav_bar.home_link.click

  @app.search_page.search_field.set @exemption_number
  @app.search_page.search_button.click

  @app.search_page.first_search_result.click
  @app.registration_details_page.exemption_details_section.click
  @app.registration_details_page.deregister_first_exemption.click
  @app.deregistration_page.deregister_exemption(
    reason: :revoke,
    exemption_deregistration_comment: "This is a test"
  )
end

Then(/^I am shown the exemption is deregistered$/) do
  expect(@app.registration_details_page.first_exemption_status.text).to include("Revoked")
end
