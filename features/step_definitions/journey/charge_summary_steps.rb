# frozen_string_literal: true

Given("I start my private beta registration") do
  # Use the "last email" API to get the invite link for the front office user
  visit(Quke::Quke.config.custom["urls"]["notify_link"])
  @invite_url = @world.journey.last_message_page.get_invite_url(@contact_email).to_s
  expect(@invite_url).to have_text("/beta/")
  puts @invite_url
  visit(@invite_url)
  @app = :fo
  @beta = true
  @world.journey.home_page.accept_cookies
  @world.journey.beta_start_page.submit
  @world.journey.location_page.submit(location: :england)
end

Given("I send a private beta invite") do
  visit(back_office_root_url("/registrations/#{@registration}"))
  @world.bo.registration_details_page.send_private_beta_invite(@registration).click
end

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
    expect(@world.journey.exemptions_summary_page.bands.first.text).to have_text(band)
  when "Discounted"
    expect(@world.journey.exemptions_summary_page.charge_types.last.text).to have_text(charge_type)
    expect(@world.journey.exemptions_summary_page.charge_amounts.last.text).to include(charge.to_s)
    expect(@world.journey.exemptions_summary_page.bands.last.text).to have_text(band)
  end

end
