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

When("I change the contact email address previously entered") do
  @world.journey.check_details_page.change_contact_email.click
  @new_contact_email = "new@example.com"
  @world.journey.contact_email_page.submit(contact_email: @new_contact_email,
                                           confirmed_email: @new_contact_email)
end

When("I change the contact phone number previously entered") do
  @world.journey.check_details_page.change_contact_tel.click
  @new_contact_phone_no = "07971 123123"
  @world.journey.contact_phone_page.submit(contact_phone: @new_contact_phone_no)
end

When("I change my farming question answers") do
  @previous_on_farm_answer = @world.journey.check_details_page.on_farm.text
  @previous_farmer_answser = @world.journey.check_details_page.farmer.text
  @world.journey.check_details_page.change_on_farm.click
  @world.journey.on_farm_page.submit
  @world.journey.check_details_page.change_farmer.click
  @world.journey.farmer_page.submit
end

When("I change my waste exemptions") do
  @existing_exemption = @world.journey.check_details_page.exemptions.text
  @world.journey.check_details_page.change_exemptions.click
  @world.journey.choose_exemptions_page.submit(exemptions: %w[T9 T12])
end

When("I change my applicant details") do
  @applicant_name = @world.journey.check_details_page.applicant_name.text
  @applicant_tel = @world.journey.check_details_page.applicant_tel.text
  @applicant_email = @world.journey.check_details_page.applicant_email.text
  @world.journey.check_details_page.change_applicant_name.click
  @new_applicant = generate_person("new_applicant@example.com")
  @world.journey.name_page.submit(first_name: @new_applicant[:first_name],
                                  last_name: @new_applicant[:last_name])
  @world.journey.check_details_page.change_applicant_tel.click
  @world.journey.phone_page.submit(tel_no: @new_applicant[:telephone])
  @world.journey.check_details_page.change_applicant_email.click
  @world.journey.email_page.submit(email: @new_applicant[:email],
                                   confirm_email: @new_applicant[:email])
end

When("I change the business address") do
  @company_address = @world.journey.check_details_page.company_address.text
  @new_postcode = "BS1 1YY"
  @world.journey.check_details_page.change_company_address.click
  @world.journey.address_lookup_page.choose_manual_address(
    postcode: @new_postcode
  )
  @world.journey.address_manual_page.submit_manual_address(
    house_no: rand(1..99_999).to_s,
    address_line_one: "ENVIRONMENT AGENCY",
    address_line_two: "Manually entered area",
    city: "Manualton"
  )
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

Then("I can see the contact email address has been updated") do
  expect(@world.journey.check_details_page.contact_email.text).to eq(@new_contact_email)
end

Then("I can see the contact phone number has been updated") do
  expect(@world.journey.check_details_page.contact_tel.text).to eq(@new_contact_phone_no)
end

Then("I can see the farming questions have been updated") do
  expect(@world.journey.check_details_page.on_farm.text).to eq("No")
  expect(@world.journey.check_details_page.on_farm.text).not_to eq(@previous_on_farm_answer)
  expect(@world.journey.check_details_page.farmer.text).to eq("No")
  expect(@world.journey.check_details_page.farmer.text).not_to eq(@previous_farmer_answser)
end

Then("I can see the waste exemptions chosen have been updated") do
  expect(@world.journey.check_details_page.exemptions.text).to have_text(@existing_exemption)
  expect(@world.journey.check_details_page.exemptions.text).to have_text("T9")
  expect(@world.journey.check_details_page.exemptions.text).to have_text("T12")
end

Then("I can see my applicant details have been updated") do
  expect(@world.journey.check_details_page.applicant_name.text).to eq(@new_applicant[:full_name])
  expect(@world.journey.check_details_page.applicant_tel.text).to eq(@new_applicant[:telephone])
  expect(@world.journey.check_details_page.applicant_email.text).to eq(@new_applicant[:email])
end

Then("I can see the business address has been updated") do
  expect(@world.journey.check_details_page.company_address.text).not_to eq(@company_address)
  expect(@world.journey.check_details_page.company_address.text).to have_text(@new_postcode)
end
