# frozen_string_literal: true

Given("I select exemption(s) {string}") do |exemptions|
  @world.journey.choose_exemptions_page.submit(exemptions: exemptions.split)
end

Given("I confirm my waste exemption selections") do
  @world.journey.confirm_exemption_selection_page.submit(choice: :confirm)
end

Given("I choose I want to change the exemptions I’ve selected") do
  @world.journey.confirm_exemption_selection_page.submit(choice: :change)
end

Then("I can see the registration charge is £{float}") do |charge|
  expected = charge == charge.to_i ? charge.to_i.to_s : charge.to_s
  expect(@world.journey.exemptions_summary_page.registration_charge.text).to include(expected)
end

Then("I can see the total charge is £{float}") do |charge|
  puts current_url
  expected = charge == charge.to_i ? charge.to_i.to_s : charge.to_s
  expect(trim_comma(@world.journey.exemptions_summary_page.total_charge.last.text)).to include(expected)
end

When("I select that I am registering as a charity") do
  @world.journey.business_type_page.submit(business_type: :charity)
end

Then("I should not see a discounted charge applied") do
  @world.journey.exemptions_summary_page.charge_amounts.each do |amount|
    expect(amount.text).not_to include("(d)")
  end
end
