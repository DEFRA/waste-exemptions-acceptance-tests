# frozen_string_literal: true

Then("I complete a limited companies registration") do
  @world.bo.dashboard_page.create_new_registration.click

  @world.current_reg = generate_registration(:limited)

  # This also stores the exemption number so the exemption can be edited in later steps.
  @world.last_reference = add_submitted_registration(@world.current_reg, false, "random", "random")
end

Then("I complete a partnerships registration") do
  @world.bo.dashboard_page.create_new_registration.click

  @world.current_reg = generate_registration(:partnership)

  # Stores the exemption number so the exemption can be edited in later steps
  @world.last_reference = add_submitted_registration(@world.current_reg, false)
end

Then("I complete an in progress registration") do
  find_link("Waste exemptions back office").click
  @world.bo.dashboard_page.unsubmitted_filter.click
  @world.bo.dashboard_page.submit(search_term: "Mr Waste")
  sleep(10)

  # Check first that I can view details for an in progress registration (RUBY-329)
  @world.bo.dashboard_page.view_details_links[0].click
  expect(@world.bo.registration_details_page.heading).to have_text("In-progress registration details for")
  @world.bo.registration_details_page.back_link.click

  # Start the resume process
  @world.bo.dashboard_page.unsubmitted_filter.click
  @world.bo.dashboard_page.submit(search_term: "Mr Waste")
  sleep(10)
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
