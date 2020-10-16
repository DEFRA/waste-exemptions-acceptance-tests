# frozen_string_literal: true

def test_journey_validations(reg, reg_type)
  # This function tests error validations for the 'new registration' or 'renewal' journey
  # for 'reg', which is a hash containing a full set of registration data.
  # It runs from the applicant details to the end of the journey.
  # reg_type is "new" or "renew". For renewals, most fields are prepopulated.
  # If those prepopulated fields are radio buttons, a user can't generate an error.
  # It is split into small functions to help reuse and keep Rubocop happy.

  test_exemption_validations(reg, reg_type)
  test_applicant_validations(reg[:applicant])
  test_operator_type_validations(reg, reg_type)
  test_operator_name_address_validation(reg[:operator_name], reg_type)
  test_contact_validations(reg[:contact], reg_type)
  test_farm_validations(reg, reg_type)
  test_site_validations(reg_type)
  test_confirmation_validations
end

def test_exemption_validations(reg, reg_type)
  if reg_type == "new"
    # Submit empty page
    @world.journey.choose_exemptions_page.submit_button.click
  else
    # Deselect existing exemptions:
    @world.journey.choose_exemptions_page.submit(exemptions: %w[U2 U12 T6 T31 S1])
    # Store new exemption values:
    reg[:exemptions] = %w[U2 T6 T31 S1 S3]
  end

  expect(@world.journey.choose_exemptions_page.error).to have_text("You must select at least one exemption")
  check_for_accessibility
  @world.journey.choose_exemptions_page.submit(exemptions: reg[:exemptions])
end

def test_applicant_validations(applicant)
  test_name_validations(applicant)
  test_phone_validations(applicant[:telephone])
  test_email_validations(applicant[:email])
end

def test_name_validations(person)
  # Tests validations on the applicant and contact name pages.
  @world.journey.name_page.submit(first_name: "", last_name: "")
  expect(@world.journey.name_page.error).to have_text("You must enter a first name")
  expect(@world.journey.name_page.error).to have_text("You must enter a last name")
  check_for_accessibility
  @world.journey.name_page.submit(
    first_name: person[:first_name],
    last_name: person[:last_name]
  )
end

def test_phone_validations(phone_no)
  # Tests validations on applicant and contact phone number pages.
  @world.journey.phone_page.submit(tel_no: "")
  expect(@world.journey.phone_page.error).to have_text("Enter a telephone number")
  check_for_accessibility
  @world.journey.phone_page.submit(tel_no: phone_no)
end

def test_email_validations(email_address)
  @world.journey.email_page.submit(email: "", confirm_email: "")
  expect(@world.journey.email_page.error).to have_text("Enter an email address")
  @world.journey.email_page.submit(
    email: "a@example.com",
    confirm_email: "b@example.com"
  )
  expect(@world.journey.email_page.error).to have_text("The email addresses you’ve entered don’t match")
  check_for_accessibility
  @world.journey.email_page.submit(
    email: email_address,
    confirm_email: email_address
  )
end

def test_operator_type_validations(reg, reg_type)
  # Business type page
  @world.journey.business_type_page.submit_button.click
  if reg_type == "new"
    expect(@world.journey.business_type_page.error).to have_text("You must answer this question")
    @world.journey.business_type_page.submit(business_type: reg[:business_type])
  end

  # Company registration number page
  @world.journey.registration_number_page.submit(registration_number: "")
  expect(@world.journey.registration_number_page.error).to have_text("Enter a company registration number")
  check_for_accessibility
  @world.journey.registration_number_page.submit(registration_number: reg[:registration_number])
end

def test_operator_name_address_validation(operator_name, reg_type)
  # Operator name page
  @world.journey.operator_name_page.submit(org_name: "")
  expect(@world.journey.operator_name_page.error).to have_text("You must enter a name")
  @world.journey.operator_name_page.submit(org_name: operator_name)

  # Operator address page
  expect(@world.journey.address_lookup_page.heading).to have_text("What's the company address?")
  check_for_accessibility
  # Generate errors on the address pages with the given text in the postcode field:
  test_address_validations("ROSS KEMP", reg_type)
end

def test_address_validations(postcode_text, reg_type)
  # This function, and its sub-functions, generates and tests errors in each address field.
  # It is run 3 times through the registration flow.
  test_address_lookup_validation(postcode_text, reg_type)
  @world.journey.address_lookup_page.choose_manual_address(
    postcode: "BS1 5AH"
  )
  test_address_manual_validation
end

def test_address_lookup_validation(postcode_text, reg_type)
  # Wait statement required to handle redirect:
  @world.journey.address_lookup_page.wait_until_find_address_visible
  leave_postcode_blank
  dont_select_address_from_dropdown if reg_type == "new"
  enter_invalid_postcode(postcode_text)
end

def leave_postcode_blank
  @world.journey.address_lookup_page.enter_postcode("")
  expect(@world.journey.address_lookup_page.error).to have_text("Enter a postcode")
  check_for_accessibility
end

def dont_select_address_from_dropdown
  # Relates to a bug fixed in RUBY-721.
  # This only works on new registrations. If it's a renewal, the address is auto-populated.
  @world.journey.address_lookup_page.enter_postcode("BS1 5AH")
  @world.journey.address_lookup_page.submit_button.click
  expect(@world.journey.address_lookup_page.error).to have_text("You must select an address")
  check_for_accessibility
  find_link("Change postcode").click
end

def enter_invalid_postcode(postcode_text)
  @world.journey.address_lookup_page.enter_postcode(postcode_text)
  @world.journey.address_lookup_page.find_address.click
  expect(@world.journey.address_lookup_page.error).to have_text("Enter a valid UK postcode")
  check_for_accessibility
end

def test_address_manual_validation
  # Wait statement required to handle redirect:
  @world.journey.address_manual_page.wait_until_house_no_visible

  # Enter an empty address:
  @world.journey.address_manual_page.submit_manual_address(
    house_no: "",
    address_line_one: "",
    address_line_two: "",
    city: ""
  )
  expect(@world.journey.address_manual_page.error).to have_text("Enter the building name or number")
  expect(@world.journey.address_manual_page.error).to have_text("Enter an address line 1")
  expect(@world.journey.address_manual_page.error).to have_text("Enter a town or city")
  check_for_accessibility

  # Enter valid details:
  @world.journey.address_manual_page.submit_manual_address(
    house_no: rand(1..99_999).to_s,
    address_line_one: "Manual road",
    address_line_two: "Manual area",
    city: "Manualton"
  )
end

def test_contact_validations(contact, reg_type)
  # contact is a hash containing contact details.
  test_name_validations(contact)

  # Contact position page has no 'empty field' validation
  expect(@world.journey.contact_position_page.heading).to have_text("What's their position?")
  @world.journey.contact_position_page.submit_button.click

  test_phone_validations(contact[:telephone])
  test_email_validations(contact[:email])
  expect(@world.journey.address_lookup_page.heading).to have_text("What's their postcode?")
  check_for_accessibility
  test_address_validations("STEVE MCFADDEN", reg_type)
end

def test_farm_validations(reg, reg_type)
  # On a farm page
  @world.journey.on_farm_page.submit_button.click
  if reg_type == "new"
    expect(@world.journey.on_farm_page.error).to have_text("You must answer this question")
    @world.journey.on_farm_page.submit(on_farm: reg[:on_farm])
  end

  # Is a farmer page
  @world.journey.farmer_page.submit_button.click
  return unless reg_type == "new"

  expect(@world.journey.farmer_page.error).to have_text("You must answer this question")
  check_for_accessibility
  @world.journey.farmer_page.submit(farmer: reg[:farmer])
end

def test_site_validations(reg_type)
  heading = @world.journey.site_grid_reference_page.heading.text
  if reg_type == "new" || heading == "Where will this waste operation take place?"
    # Site grid reference page
    @world.journey.site_grid_reference_page.submit(grid_ref: "", site_details: "")
    expect(@world.journey.site_grid_reference_page.error).to have_text("Enter a grid reference")
    expect(@world.journey.site_grid_reference_page.error).to have_text("Enter a site description")
    check_for_accessibility
    find_link("use an address instead").click
  end

  test_address_validations("JUNE BROWN", reg_type)
end

def test_confirmation_validations
  # Check your answer page doesn't have validation:
  expect(@world.journey.check_details_page.heading).to have_text("Check your answers")
  @world.journey.check_details_page.submit_button.click

  # Declaration page
  @world.journey.declaration_page.submit_button.click
  # rubocop:disable Layout/LineLength
  expect(@world.journey.declaration_page.error).to have_text("You cannot register if you do not understand and agree with the declaration")
  # rubocop:enable Layout/LineLength
  check_for_accessibility
  @world.journey.declaration_page.submit
end
