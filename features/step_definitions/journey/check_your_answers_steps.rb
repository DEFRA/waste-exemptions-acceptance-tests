# frozen_string_literal: true

When("I change the contact name previously entered") do
  @world.journey.check_details_page.change_contact_name.click
  @new_contact = generate_person("new_contact@example.com")
  @world.journey.contact_name_page.submit(first_name: @new_contact[:first_name],
                                          last_name: @new_contact[:last_name])
end

When("I change the operator name previously entered") do
  @world.journey.check_details_page.change_operator_name.click
  @new_operator_name = "New operator name"
  @world.journey.operator_name_page.submit(org_name: @new_operator_name)
end

When("I change the contact position previously entered") do
  @world.journey.check_details_page.change_contact_position.click
  @new_position = "Mangler"
  @world.journey.contact_position_page.submit(position: @new_position)
end

When("I change the contact address previously entered") do
  @contact_address = remove_new_lines_from_address(@world.journey.check_details_page.contact_address.text)
  @world.journey.check_details_page.change_contact_address.click
  complete_address(:manual)
end

Then("I can see the contact name has been updated") do
  expect(@world.journey.check_details_page.contact_name.text).to eq(@new_contact[:full_name])
  expect(@world.journey.check_details_page.contact_name.text).not_to eq(@applicant[:full_name])
end

Then("I can see the operator name has been updated") do
  expect(@world.journey.check_details_page.operator_name.text).to eq(@new_operator_name)
end

Then("I can not the change operator name") do
  expect(@world.journey.check_details_page).to have_no_operator_name
end

Then("I can see the contact position has been updated") do
  expect(@world.journey.check_details_page.contact_position.text).to eq(@new_position)
end

Then("I can see the contact address has been updated") do
  @new_contact_address = remove_new_lines_from_address(@world.journey.check_details_page.contact_address.text)
  raise if @contact_address.nil? || @new_contact_address.nil?

  expect(@contact_address).not_to eq(@new_contact_address)
end
