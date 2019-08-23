# frozen_string_literal: true

# Use Ruby regex here rather than Cucumber (eg {string}), as regex types can't be mixed:
Given(/^my business is (?:a|an) "([^"]*)"$/) do |business|
  @world.last_reg = generate_registration(business.to_sym)
end

Then("I register an exemption") do
  # Complete the registration. See registration_helpers for an explanation of the parameters.
  # Registration details are stored as a hash, @world.last_reg.
  # Registration number is stored as a string, @world.last_reg_no.
  @world.last_reg_no = add_submitted_registration(@world.last_reg, true, "random", "random")
end

Then("I will be informed the registration is complete") do
  expect(page).to have_content "Registration complete"
end

Then(/^I complete (?:a|an) "([^"]*)" registration$/) do |business|
  @world.bo.dashboard_page.create_new_registration.click
  # Click through the links on the privacy policy page:
  @world.journey.ad_privacy_policy_page.policy_text_link.click
  @world.journey.ad_privacy_policy_page.dpo_details_link.click
  @world.journey.ad_privacy_policy_page.ico_details_link.click
  expect(@world.journey.ad_privacy_policy_page.content).to have_text("European Economic Area")
  @world.journey.ad_privacy_policy_page.continue_button.click
  @world.last_reg = generate_registration(business.to_sym)

  # This also stores the exemption number so the exemption can be edited in later steps.
  @world.last_reg_no = add_submitted_registration(@world.last_reg, false, "random", "random")
end

Then("I complete an in progress registration") do
  find_link("Waste exemptions back office").click
  # Add a sleep here, because the automated tests often have a problem with the filter steps:
  sleep(1)
  @world.bo.dashboard_page.unsubmitted_filter.click
  @world.bo.dashboard_page.submit(search_term: "Mr Waste")

  # Check first that I can view details for an in progress registration (RUBY-329)

  @world.bo.dashboard_page.view_transient_details_links[0].click
  expect(@world.bo.registration_details_page.heading).to have_text("In-progress registration details")
  @world.bo.registration_details_page.back_link.click

  # Start the resume process
  @world.bo.dashboard_page.unsubmitted_filter.click
  @world.bo.dashboard_page.submit(search_term: "Mr Waste")
  @world.bo.dashboard_page.resume_links[0].click
  expect(page).to have_content("Who should we contact about this waste exemption operation?")

  # Generate the data for the rest of the registration and save it as a world variable:
  @world.reg_to_complete = generate_registration(:individual, "a name that won't be used")

  # Complete the registration and store the registration number.
  @world.completed_reg = continue_unsubmitted_registration(@world.reg_to_complete, "random", "random")
end

Then("I can find and edit the registration I just submitted") do
  # Search for the registration I just completed:
  @world.bo.registration_complete_page.home_link.click
  @world.bo.dashboard_page.submitted_filter.click
  @world.bo.dashboard_page.submit(search_term: @world.completed_reg)
  expect(@world.bo.dashboard_page).to have_results
  expect(page).to have_content(@world.reg_to_complete[:applicant][:first_name].to_s)

  # Edit the applicant's name so that it doesn't appear in the submitted search results
  find_link("Edit").click
  expect(@world.bo.edit_page.heading).to have_text("Edit " + @world.completed_reg + " registration")
  @world.bo.edit_page.change_operator_link.click
  @world.bo.edit_details_page.submit(
    operator_name: "Miss Waste Completed"
  )
  @world.bo.edit_page.continue_button.click
  @world.journey.declaration_page.submit
  expect(@world.bo.edit_details_page.heading).to have_text("Edit complete")
  @world.bo.edit_details_page.continue_button.click
end
