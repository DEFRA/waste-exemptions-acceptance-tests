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
  @contact_address = remove_new_lines_from_text(@world.journey.check_details_page.contact_address.text)
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
  @previous_farmer_answer = @world.journey.check_details_page.farmer.text
  @world.journey.check_details_page.change_on_farm.click
  @world.journey.on_farm_page.submit(on_farm: :on_farm)
  @world.journey.check_details_page.change_farmer.click
  @world.journey.farmer_page.submit(farmer: :farmer)
end

When("I choose to change my waste exemptions") do
  exemptions = @world.journey.check_details_page.exemptions.text
  @existing_exemptions = strip_text_whitespace_convert_to_array(exemptions)
  @world.journey.check_details_page.change_exemptions.click
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
  @company_address = @world.journey.check_details_page.operator_address.text
  @new_postcode = "BS1 1YY"
  @world.journey.check_details_page.change_operator_address.click
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

When("I change the site address") do
  @site_address = @world.journey.check_details_page.site_address.text
  @world.journey.check_details_page.change_site_address.click
  @world.journey.check_site_address_page.submit(choice: :use_different_address)
  @world.journey.address_lookup_page.submit(postcode: "BS1 5AH",
                                            result: "THRIVE RENEWABLES PLC, DEANERY ROAD, BRISTOL, BS1 5AH")
end

When("I change to a site address") do
  @world.journey.check_details_page.change_site_location.first.click
  find_link("postcode").click
  @new_address = "THRIVE RENEWABLES PLC, DEANERY ROAD, BRISTOL, BS1 5AH"
  @world.journey.address_lookup_page.submit(postcode: "BS1 5AH",
                                            result: @new_address)
end

When("I change the site national grid reference") do
  @world.journey.check_details_page.change_site_location.first.click
  @new_ngr = "SD 91402 09578"
  @new_site_description = "correct location"
  @world.journey.site_grid_reference_page.submit(
    grid_ref: @new_ngr,
    site_details: @new_site_description
  )
end

When("I change my companies house number") do
  @old_registered_name = @world.journey.check_details_page.company_name.text
  @world.journey.check_details_page.change_companies_house_number.click
  @new_companies_house_number = "10336040"
  @world.journey.registration_number_page.submit(
    registration_number: @new_companies_house_number
  )
end

When("I add another partner") do
  @world.journey.check_details_page.change_partner_details.click
  @new_partner = generate_person("partner@example.com")
  @world.journey.partners_page.submit(
    first_name: @new_partner[:first_name],
    last_name: @new_partner[:last_name]
  )
end

When("I confirm my business details are correct") do
  @world.journey.check_registered_company_name_page.submit(choice: :confirm)
end

When("I change the companies house number") do
  @world.journey.check_details_page.change_companies_house_number.click
  @world.journey.registration_number_page.submit(
    registration_number: "10336040"
  )
  @new_company_name = @world.journey.check_registered_company_name_page.company_name.text
  @world.journey.check_registered_company_name_page.submit(choice: :confirm)
end

Then("I can see the company name has been updated") do
  expect(@world.journey.check_details_page.company_name.text).to eq(@new_company_name)
end

Then("I can see the contact name has been updated") do
  expect(@world.journey.check_details_page.contact_name.text).to eq(@new_contact[:full_name])
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
  @new_contact_address = remove_new_lines_from_text(@world.journey.check_details_page.contact_address.text)
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
  expect(@world.journey.check_details_page.on_farm.text).to eq("Yes")
  expect(@world.journey.check_details_page.on_farm.text).not_to eq(@previous_on_farm_answer)
  expect(@world.journey.check_details_page.farmer.text).to eq("Yes")
  expect(@world.journey.check_details_page.farmer.text).not_to eq(@previous_farmer_answer)
end

Then("I can see the waste exemptions chosen have been updated") do
  expect(@world.journey.check_details_page.exemptions_displayed?(@existing_exemptions)).to eq(true)
end

Then("I can see my applicant details have been updated") do
  expect(@world.journey.check_details_page.applicant_name.text).to eq(@new_applicant[:full_name])
  expect(@world.journey.check_details_page.applicant_tel.text).to eq(@new_applicant[:telephone])
  expect(@world.journey.check_details_page.applicant_email.text).to eq(@new_applicant[:email])
end

Then("I can see the business address has been updated") do
  expect(@world.journey.check_details_page.operator_address.text).not_to eq(@company_address)
  expect(@world.journey.check_details_page.operator_address.text).to have_text(@new_postcode)
end

Then("I can see the site address has been updated") do
  @new_site_address = @world.journey.check_details_page.site_address.text
  expect(@site_address).not_to eq(@new_site_address)
end

Then("I can see the site address on the check your answers page") do
  expect(remove_new_lines_from_text(@world.journey.check_details_page.site_address.text)).to eq(@new_address)
end

Then("I can see the site location has been updated") do
  expect(@world.journey.check_details_page.grid_ref.text).to eq(@new_ngr)
  expect(@world.journey.check_details_page.site_desc.text).to eq(@new_site_description)
end

Then("my company details have been updated") do
  expect(@world.journey.check_details_page.companies_house_number.text).to eq(@new_companies_house_number)
  expect(@old_registered_name).not_to eq @world.journey.check_details_page.company_name.text
end

Then("I can see the partner added to the check your answers page") do
  expect(@world.journey.check_details_page.partner_details.text).to have_text(@new_partner[:full_name])
end
