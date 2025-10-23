# frozen_string_literal: true

Given("I select exemption(s) {string}") do |exemptions|
  @world.journey.choose_exemptions_page.submit(exemptions: exemptions.split)
end

Given("I confirm my waste exemption selections") do
  @world.journey.confirm_exemption_selection_page.submit(choice: :confirm)
end

Given(/^I confirm my farming waste exemption selections|I confirm I do not want any more waste exemptions$/) do
  @world.journey.confirm_farming_exemption_selection_page.submit(choice: :confirm)
end

Given("I choose to add waste exemptions that are not included in the farming exemptions") do
  @world.journey.confirm_farming_exemption_selection_page.submit(choice: :change)
end

Given("I choose I want to change the exemptions I’ve selected") do
  @world.journey.confirm_exemption_selection_page.submit(choice: :change)
end

Then("I can see the registration charge is £{int}") do |charge|
  expect(@world.journey.exemptions_summary_page.registration_charge.text).to include(charge.to_s)
end

Then("I can see the total charge is £{int}") do |charge|
  puts current_url
  expect(trim_comma(@world.journey.exemptions_summary_page.total_charge.text)).to include(charge.to_s)
end

When("I select that I am registering as a charity") do
  @world.journey.business_type_page.submit(business_type: :charity)
end
