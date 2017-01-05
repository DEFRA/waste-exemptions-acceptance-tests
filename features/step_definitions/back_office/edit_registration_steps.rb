When(/^I revoke a registration$/) do

  @app.search_page.nav_bar.home_link.click

  @app.search_page.search_field.set @exemption_number
  @app.search_page.search_button.click

  @app.search_page.first_search_result.click

  @app.registration_details_page.deregister.click

  @app.deregistration_page.deregister_registration(
    reason: :revoke,
    reg_dereg_comment: "This is a test"
  )
end

When(/^I cease a registration$/) do

  @app.search_page.nav_bar.home_link.click

  @app.search_page.search_field.set @exemption_number
  @app.search_page.search_button.click

  @app.search_page.first_search_result.click

  @app.registration_details_page.deregister.click

  @app.deregistration_page.deregister_registration(
    reason: :cease,
    reg_dereg_comment: "This is a test"
  )
end

Then(/^I will see the registration is deregistered$/) do

  expect(@app.registration_details_page.text).to include("Enrollment deregistered successfully")

  @app.search_page.nav_bar.sign_out_link.click

end

When(/^I deregister an exemption$/) do
  @app.search_page.nav_bar.home_link.click

  @app.search_page.search_field.set @exemption_number
  @app.search_page.search_button.click

  @app.search_page.first_search_result.click
  sleep(10)
  @app.registration_details_page.exemption_details_section.click
  @app.registration_details_page.deregister_first_exemption.click
  @app.deregistration_page.deregister_exemption(
    reason: :revoke,
    exemption_dereg_comment: "This is a test"
  )
end

Then(/^when I deregister the last active exemption$/) do
  @app.search_page.nav_bar.home_link.click

  @app.search_page.search_field.set @exemption_number
  @app.search_page.search_button.click

  @app.search_page.first_search_result.click
  @app.registration_details_page.exemption_details_section.click
  @app.registration_details_page.deregister_last_exemption.click
  @app.deregistration_page.deregister_exemption(
    reason: :revoke,
    exemption_dereg_comment: "This is a test"
  )
end

Then(/^I can see the exemption is deregistered$/) do
  expect(@app.registration_details_page.first_exemption_status.text).to include("Revoked")
end

Then(/^I can see the registration is deregistered$/) do
  expect(@app.registration_details_page.registration_status.text).to eq("Revoked")
  @app.search_page.nav_bar.sign_out_link.click
end
