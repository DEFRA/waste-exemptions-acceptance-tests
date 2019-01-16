Given(/^I start a new waste exemption registraton$/) do
  @app = App.new
  @app.front_office_home_page.load
  @app.registration_type_page.submit_new
end

When(/^I register an exemption$/) do
  @app.choose_exemptions_page.submit(
    exemptions: %w[S1]
  )
  @app.check_details_page.submit
  @app.declaration_page.submit
end

When(/^I register an exemption "([^"]*)"$/) do |exemption|
  @app.choose_exemptions_page.choose_exemption(exemption)
  @app.check_details_page.submit
  @app.declaration_page.submit
end

When(/^I register multiple exemptions$/) do
  @app.choose_exemptions_page.submit(
    exemptions: %w[D2 S1]
  )
  @app.check_details_page.submit
  @app.declaration_page.submit
end

Then(/^I will be informed the registration is complete$/) do
  expect(page).to have_content "Registration complete"
end

Then(/^I will be on the "([^"]*)" page$/) do |page_name|
  expect(@app.last_page.current_url).to include(page_name)
end
