# frozen_string_literal: true

When("I edit the applicants phone number") do
  # Last registration number is stored in @world.last_reg_no.
  # Search for the last reference number:
  @world.bo.dashboard_page.submit(search_term: @world.last_reg_no)
  find_link("Edit").click
  expect(@world.bo.edit_page.heading).to have_text("Edit #{@world.last_reg_no} registration")

  # Generate data using the functions in data_generator.rb
  @new_details = generate_registration(:individual, "Mr Waste")
  @new_person = generate_person("wex@example.com")

  @world.bo.edit_page.change_applicant_phone.click
  @updated_detail = @new_person[:telephone]
  @world.journey.phone_page.submit(tel_no: @updated_detail)
  @change_reason = "Applicant phone number changed"
end

When("I edit the contact email address") do
  # Last registration number is stored in @world.last_reg_no.
  # Search for the last reference number:
  @world.bo.dashboard_page.submit(search_term: @world.last_reg_no)
  find_link("Edit").click
  expect(@world.bo.edit_page.heading).to have_text("Edit #{@world.last_reg_no} registration")

  # Generate data using the functions in data_generator.rb
  @new_details = generate_registration(:individual, "Mr Waste")
  @new_person = generate_person("wex@example.com")

  # Edit the contact email
  @world.bo.edit_page.change_contact_email_link.click
  @updated_detail = @new_person[:email]
  @world.journey.email_page.submit(
    email: @new_person[:email],
    confirm_email: @new_person[:email]
  )
  @change_reason = "Contact email address changed"
end

When("I edit the site location") do
  # Last registration number is stored in @world.last_reg_no.
  # Search for the last reference number:
  @world.bo.dashboard_page.submit(search_term: @world.last_reg_no)
  find_link("Edit").click
  expect(@world.bo.edit_page.heading).to have_text("Edit #{@world.last_reg_no} registration")

  # Edit the site location
  @world.bo.edit_page.change_site_location.click

  @world.journey.site_grid_reference_page.choose_address.click
  @updated_detail = "BUCKINGHAM PALACE, LONDON, SW1A 1AA"
  @world.journey.address_lookup_page.submit(postcode: "SW1A 1AA",
                                            result: "BUCKINGHAM PALACE, LONDON, SW1A 1AA")
  @change_reason = "Site location address updated"
end

When("I edit the contact address") do
  # Last registration number is stored in @world.last_reg_no.
  # Search for the last reference number:
  @world.bo.dashboard_page.submit(search_term: @world.last_reg_no)
  find_link("Edit").click
  expect(@world.bo.edit_page.heading).to have_text("Edit #{@world.last_reg_no} registration")
  sleep(20)
  @world.bo.edit_page.change_contact_address.click

  @updated_detail = "BUCKINGHAM PALACE, LONDON, SW1A 1AA"
  @world.journey.address_lookup_page.submit(postcode: "SW1A 1AA",
                                            result: "BUCKINGHAM PALACE, LONDON, SW1A 1AA")
  @change_reason = "Contact address updated"
end

When("I edit the most recent registration") do
  @world.bo.dashboard_page.submit(search_term: @world.last_reg_no)
  find_link("Edit").click
  # Generate data using the functions in data_generator.rb
  @new_details = generate_registration(:individual, "Mr Waste")
  @new_person = generate_person("wex@example.com")

  # Edit the contact email
  @world.bo.edit_page.change_contact_email_link.click
  @world.journey.email_page.submit(
    email: @new_person[:email],
    confirm_email: @new_person[:email]
  )
end

Then("I can see the new details on the registration details page") do
  expected_text = remove_new_lines_from_text(@world.bo.registration_details_page.text)
  expect(expected_text).to have_text(@updated_detail)
end

Then("I can see the updated location in the registration's sites list") do
  @world.bo.registration_details_page.sites.click
  expected_text = remove_new_lines_from_text(@world.bo.sites_page.sites.first.location.text)
  expect(expected_text).to have_text(@updated_detail)
end

When("I cannot edit the most recent registration") do
  @world.bo.dashboard_page.admin_menu.home_page.click
  @world.bo.dashboard_page.submit(search_term: @world.last_reg_no)
  expect(@world.bo.dashboard_page).not_to have_text("Edit")
end

When("I can edit the most recent registration") do
  @world.bo.dashboard_page.admin_menu.home_page.click
  @world.bo.dashboard_page.submit(search_term: @world.last_reg_no)
  expect(@world.bo.dashboard_page).to have_text("Edit")
end

When("I complete the edit") do
  sleep(1)
  @world.bo.edit_page.submit
  @world.bo.edit_reason_page.submit(reason: @change_reason)
  @world.journey.declaration_page.submit
  expect(@world.bo.edit_details_page.heading).to have_text("Edit complete")
  puts "#{@world.last_reg_no} edited"
  find_link("View registration").click
  expect(@world.bo.registration_details_page.heading).to have_text("Registration details for #{@world.last_reg_no}")
end

When("I cancel the edit") do
  @world.bo.edit_page.cancel_link.click
  expect(@world.bo.edit_details_page.heading).to have_text("Do you want to cancel this edit?")
  @world.bo.edit_page.submit_button.click
  expect(@world.bo.edit_details_page.heading).to have_text("Edit cancelled")
  find_link("View registration").click
end

When("I cannot see the new details on the registration details page") do
  expect(@world.bo.registration_details_page).not_to have_text(@new_person[:email])
end
