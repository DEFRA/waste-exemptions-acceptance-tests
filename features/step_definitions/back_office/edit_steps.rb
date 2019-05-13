# frozen_string_literal: true

When("I edit the most recent registration") do
  # Last registration number is stored in @world.last_reference.
  # Search for the last reference number:
  @world.bo.dashboard_page.submit(search_term: @world.last_reference)
  find_link("Edit").click
  puts "Registration: " + @world.last_reference
  expect(@world.bo.edit_page.heading).to have_text("Edit " + @world.last_reference + " registration")

  # Generate data using the functions in data_generator.rb
  @new_details = generate_registration(:limited, nil)
  @new_person = generate_person

  # Edit the applicant's name to something random
  @world.bo.edit_page.change_applicant_link.click
  @world.bo.edit_details_page.submit(
    first_name: @new_person[:first_name],
    last_name: @new_person[:last_name]
  )

  # Edit the operator name
  @world.bo.edit_page.change_operator_link.click
  @world.bo.edit_details_page.submit(
    operator_name: @new_details[:operator_name]
  )

  # Edit the contact email
  @world.bo.edit_page.change_contact_email_link.click
  @world.bo.edit_details_page.submit(
    contact_email: @new_person[:email]
  )

end

When("I can see the new details on the registration details page") do
  @world.bo.registration_details_page.reporting_info_link.click
  expect(@world.bo.registration_details_page.content).to have_text(@new_person[:first_name])
  expect(@world.bo.registration_details_page.content).to have_text(@new_person[:last_name])
  expect(@world.bo.registration_details_page.content).to have_text(@new_person[:email])
  # The 'not_' in the next line is because of bug RUBY-325:
  expect(@world.bo.registration_details_page.content).not_to have_text(@new_details[:operator_name])
  expect(@world.bo.registration_details_page.content).to have_text(@new_person[:first_name])
end

When("I cannot edit the most recent registration") do
  @world.bo.dashboard_page.submit(search_term: @world.last_reference)
  expect(@world.bo.dashboard_page.content).not_to have_text("Edit")
end

When("I complete the edit") do
  @world.bo.edit_page.continue_button.click
  @world.journey.declaration_page.submit
  expect(@world.bo.edit_details_page.heading).to have_text("Edit complete")
  @world.bo.edit_details_page.continue_button.click
  expect(@world.bo.registration_details_page.heading).to have_text("Registration details for " + @world.last_reference)
end

When("I cancel the edit") do
  @world.bo.edit_page.cancel_link.click
  expect(@world.bo.edit_details_page.heading).to have_text("Do you want to cancel this edit?")
  @world.bo.edit_details_page.continue_button.click
  expect(@world.bo.edit_details_page.heading).to have_text("Edit cancelled")
  @world.bo.edit_details_page.continue_button.click
end

When("I cannot see the new details on the registration details page") do
  @world.bo.registration_details_page.reporting_info_link.click
  expect(@world.bo.registration_details_page.content).not_to have_text(@new_person[:first_name])
  expect(@world.bo.registration_details_page.content).not_to have_text(@new_person[:last_name])
  expect(@world.bo.registration_details_page.content).not_to have_text(@new_person[:email])
  expect(@world.bo.registration_details_page.content).not_to have_text(@new_details[:operator_name])
end
