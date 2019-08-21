# frozen_string_literal: true

When("I search for a registration to renew") do
  # Search for the most recent registration and start renewal:
  @world.bo.dashboard_page.submit(search_term: @world.last_reg_no)
  find_link("Start renewal").click
  @world.journey.ad_privacy_policy_page.continue_button.click
end

When("I renew the most recent registration {string} changes") do |changes|
  # Check some details at the start of the renewal journey:
  expect(@world.journey.renew_choice_page.heading).to have_text("Do you want to renew with these details?")
  content = @world.journey.renew_choice_page.content
  expect(content).to have_text("U12 - Using mulch")
  expect(content).to have_text("the company name is " + @world.last_reg[:operator_name])
  expect(content).to have_text("the Companies House number is " + @world.last_reg[:registration_number])
  expect(content).to have_text("your name is " + @world.last_reg[:applicant][:full_name].to_s)

  if changes == "without"
    @world.journey.renew_choice_page.renew_without_changes_radio.click
    @world.journey.renew_choice_page.continue_button.click
    # rubocop:disable Metrics/LineLength
    expect(@world.journey.renew_splash_page.heading).to have_text("You are about to renew for 3 years with the current details")
    # rubocop:enable Metrics/LineLength
    @world.journey.renew_splash_page.continue_button.click
    @world.journey.declaration_page.submit
    # rubocop:disable Metrics/LineLength
    expect(@world.journey.confirmation_page.confirmation_box).to have_text("You have renewed your exemptions for 3 years")
    # rubocop:enable Metrics/LineLength
    @renewed_reg = @world.last_reg # renewed reg has same details as before
    @renewed_reg_no = @world.journey.confirmation_page.ref_no.text
    puts @world.last_reg_no + " renewed with no changes. New registration is " + @renewed_reg_no + "."

  elsif changes == "with"

    @renewed_reg = generate_registration(:individual, nil)

    # generate some new data
    # edit the business type to individual
    # check for prepopulated fields throughout
    # check company number doesn't show on the 'check your details'

  end

  # Check that the @renewed_reg details appear on the new screen

end

Then("I can see the correct renewed details") do
  find_link("Dashboard").click
  @world.bo.dashboard_page.submit(search_term: @renewed_reg_no)
  find_link("View details").click
  @world.bo.registration_details_page.reporting_info_link.click
  content = @world.bo.registration_details_page.content
  expect(content).to have_text("U12 — Using mulch")
  expect(content).to have_text(@renewed_reg[:operator_name])
  expect(content).to have_text(@renewed_reg[:registration_number])
  expect(content).to have_text(@renewed_reg[:applicant][:last_name].to_s)
  expect(content).to have_text(@renewed_reg[:applicant][:email].to_s)
  expect(content).to have_text(@renewed_reg[:contact][:email].to_s)
end

Then("I can renew it again") do
  # The intended behaviour is actually for back office NOT to be able to renew a registration here.
  # This will be fixed in RUBY-602.
  find_link("Dashboard").click
  @world.bo.dashboard_page.submit(search_term: @world.last_reg_no)
  find_link("Start renewal").click
  @world.journey.ad_privacy_policy_page.continue_button.click
  expect(@world.journey.renew_choice_page.heading).to have_text("Do you want to renew with these details?")
end
