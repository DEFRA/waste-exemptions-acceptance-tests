When(/^I am on the waste exemptions dashboard$/) do
  expect(@app.registration_dashboard_page).to have_text("Waste exemptions dashboard")
end

Then(/^I will not have the option to manage users$/) do
  expect(@app.registration_dashboard_page.govuk_banner).to have_no_user_management
end

When(/^I invite a new user$/) do
  @app.registration_dashboard_page.govuk_banner.user_management.click
  @app.users_page.invite_user.click
end
