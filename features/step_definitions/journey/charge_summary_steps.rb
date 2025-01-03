# frozen_string_literal: true

Given("I am participating in the private beta") do
  visit("/beta-start")
  @beta = true
  @world.journey.home_page.accept_cookies
  @world.journey.beta_start_page.submit
  @world.journey.location_page.submit(location: :england)
end

Given("I select exemption(s) {string}") do |exemptions|
  @world.journey.choose_exemptions_page.submit(exemptions: exemptions.split)
end

Given("I confirm my waste exemption selections") do
  @world.journey.confirm_exemption_selection_page.submit(choice: :confirm)
end

Then("I can see the registration charge is £{float}") do |charge|
  puts current_url
  expect(@world.journey.exemptions_summary_page.registration_charge.text).to include(charge.to_s)
end

Then("I can see the total charge is £{float}") do |charge|
  expect(trim_comma(@world.journey.exemptions_summary_page.total_charge.text)).to include(charge.to_s)
end
Then("I can see that the {string} compliance charge of band {int} exemption is £{float}") do |charge_type, band, charge|
  case charge_type
  when "Full"
    expect(@world.journey.exemptions_summary_page.charge_types.first.text).to have_text(charge_type)
    expect(trim_comma(@world.journey.exemptions_summary_page.charge_amounts.first.text)).to include(charge.to_s)
    expect(@world.journey.exemptions_summary_page.bands.first.text).to have_text(band)
  when "Discounted"
    expect(@world.journey.exemptions_summary_page.charge_types.last.text).to have_text(charge_type)
    expect(@world.journey.exemptions_summary_page.charge_amounts.last.text).to include(charge.to_s)
    expect(@world.journey.exemptions_summary_page.bands.last.text).to have_text(band)
  end

end
