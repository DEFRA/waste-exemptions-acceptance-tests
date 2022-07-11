# frozen_string_literal: true

Then("I complete an in progress registration") do
  @world.bo.dashboard_page.admin_menu.home_page.click
  # Add a sleep here, because the automated tests often have a problem with the filter steps:
  sleep(1)
  @world.bo.dashboard_page.unsubmitted_filter.click

  @world.bo.dashboard_page.submit(search_term: @last_transient_name)
  # Check first that I can view details for an in progress registration (RUBY-329)
  @world.bo.dashboard_page.view_transient_details_links[0].click
  expect(@world.bo.registration_details_page.heading).to have_text("In-progress registration details")
  @world.bo.registration_details_page.back_link.click

  # Start the resume process
  @world.bo.dashboard_page.unsubmitted_filter.click
  @world.bo.dashboard_page.submit(search_term: @last_transient_name)
  @world.bo.dashboard_page.resume_links[0].click
  expect(page).to have_content("Do you want to use this as the contact name?")

  # Generate the data for the rest of the registration and save it as a world variable:
  @world.reg_to_complete = generate_registration(:individual)

  # Complete the registration and store the registration number.
  @world.completed_reg = continue_unsubmitted_registration(@world.reg_to_complete, :random, :random)
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
  @world.bo.edit_page.submit
  @world.journey.declaration_page.submit
  expect(@world.bo.edit_details_page.heading).to have_text("Edit complete")
  find_link("View registration").click
end

Then(/^I complete (?:a|an) "([^"]*)" registration$/) do |business|
  @world.bo.dashboard_page.create_new_registration.click
  @world.journey.ad_privacy_policy_page.submit
  @world.last_reg = generate_registration(business.to_sym)

  # This also stores the exemption number so the exemption can be edited in later steps.
  @world.last_reg_no = add_submitted_registration(@world.last_reg, false, :random, :random)
end

Then(/^I complete (?:a|an) assisted digital "([^"]*)" registration$/) do |business|
  @world.bo.dashboard_page.create_new_registration.click
  @world.journey.ad_privacy_policy_page.submit
  @world.last_reg = generate_registration(business.to_sym, email: "waste-exemptions@environment-agency.gov.uk")

  # This also stores the exemption number so the exemption can be edited in later steps.
  @world.last_reg_no = add_submitted_registration(@world.last_reg, false, :random, :random)
end
