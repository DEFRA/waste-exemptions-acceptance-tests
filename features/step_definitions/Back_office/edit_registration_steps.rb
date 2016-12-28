When(/^I revoke a registration$/) do

  @app.back_office_home_page.menu_home.click
  @app.back_office_home_page.search_field.set @exemption_number
  @app.back_office_home_page.search_button.click
  @app.back_office_home_page.first_search_result.click

  @app.registration_details_page.deregister.click

  @app.deregistration_page.revoke(
    deregistration_comment: 'This is a test'
  )

end

Then(/^I will be informed the registration is revoked$/) do
  expect(@app.registration_details_page.text).to include('Enrollment deregistered successfully')

  @app.back_office_home_page.sign_out.click
end
