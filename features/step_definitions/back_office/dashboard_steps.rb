# frozen_string_literal: true

When(/^I search for "([^"]*)"$/) do |term|
  @app.registration_dashboard_page.submit(search_term: term)
end

When(/^I edit "([^"]*)"$/) do |reg|
  @app.registration_dashboard_page.edit(reg)
end

When(/^I deregister "([^"]*)"$/) do |reg|
  @app.registration_dashboard_page.deregister(reg)
end

When(/^I am on the main dashboard$/) do
  expect(@app.registration_dashboard_page).to have_text("Waste exemptions dashboard")
end

Then(/^I will not be able to create a new registration$/) do
  expect(@app.registration_dashboard_page).to have_no_create_new_registration
end
