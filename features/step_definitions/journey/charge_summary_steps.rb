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

Then("I can see the registration charge is £{float}") do |charge|
  puts current_url
  expect(@world.journey.exemptions_summary_page.registration_charge.text).to include(charge.to_s)
end

Then("I can see the total charge is £{float}") do |charge|
  puts current_url
  expect(trim_comma(@world.journey.exemptions_summary_page.total_charge.text)).to include(charge.to_s)
end

Then("I can see that the {string} compliance charge of band {int} exemption is £{float}") do |charge_type, band, charge|
  case charge_type
  when "Full"
    expect(@world.journey.exemptions_summary_page.charge_types.first.text).to have_text(charge_type)
    expect(trim_comma(@world.journey.exemptions_summary_page.charge_amounts.first.text)).to include(charge.to_s)
    if band == 4
      expect(@world.journey.exemptions_summary_page.bands.first.text).to have_text("Upper")
    else
      expect(@world.journey.exemptions_summary_page.bands.first.text).to have_text(band)
    end
  when "Discounted"
    expect(@world.journey.exemptions_summary_page.charge_types.last.text).to have_text(charge_type)
    expect(@world.journey.exemptions_summary_page.charge_amounts.last.text).to include(charge.to_s)
    if band == 4
      expect(@world.journey.exemptions_summary_page.bands.last.text).to have_text("Upper")
    else
      expect(@world.journey.exemptions_summary_page.bands.last.text).to have_text(band)
    end
  end

end

When("I select that I am registering as a charity") do
  @world.journey.business_type_page.submit(business_type: :charity)
end
