When(/^I revoke a registration$/) do

  @app.search_page.menu_home.click
  @app.search_page.search_field.set @exemption_number
  @app.search_page.search_button.click
  @app.search_page.first_search_result.click

  @app.registration_details_page.deregister.click

  @app.deregistration_page.revoke(
    deregistration_comment: "This is a test"
  )

end

When(/^I cease a registration$/) do
  @app.search_page.menu_home.click
  @app.search_page.search_field.set @exemption_number
  @app.search_page.search_button.click
  @app.search_page.first_search_result.click

  @app.registration_details_page.deregister.click

  @app.deregistration_page.cease(
    deregistration_comment: "This is a test"
  )
end

Then(/^I will be informed the registration is deregistered$/) do

  expect(@app.registration_details_page.text).to include("Enrollment deregistered successfully")

  @app.search_page.sign_out.click

end
