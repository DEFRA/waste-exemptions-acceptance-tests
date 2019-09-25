# frozen_string_literal: true

Given "I complete a registration badly" do
  # add_submitted_registration
  @world.journey.home_page.load
  reg = @world.last_reg # shorthand for the registration data that has been generated

  # Start page
  @world.journey.registration_type_page.submit_button.click
  expect(@world.journey.registration_type_page.error).to have_text("You must answer this question")
  @world.journey.registration_type_page.submit(start_option: :new_radio)

  # Location page
  @world.journey.location_page.submit_button.click
  expect(@world.journey.location_page.error).to have_text("You must answer this question")
  @world.journey.location_page.submit(location: :england)

  # Exemptions page
  @world.journey.choose_exemptions_page.submit_button.click
  expect(@world.journey.choose_exemptions_page.error).to have_text("You must select at least one exemption")
  @world.journey.choose_exemptions_page.submit(exemptions: reg[:exemptions])

  # Applicant name page
  @world.journey.applicant_name_page.submit_button.click
  expect(@world.journey.applicant_name_page.error).to have_text("You must enter a first name")
  expect(@world.journey.applicant_name_page.error).to have_text("You must enter a last name")
  @world.journey.applicant_name_page.submit(
    first_name: reg[:applicant][:first_name],
    last_name: reg[:applicant][:last_name]
  )

  # Applicant phone page
  @world.journey.applicant_phone_page.submit_button.click
  expect(@world.journey.applicant_phone_page.error).to have_text("Enter a telephone number")
  @world.journey.applicant_phone_page.submit(tel_number: reg[:applicant][:telephone])

  # Applicant email page
  @world.journey.applicant_email_page.submit_button.click
  expect(@world.journey.applicant_email_page.error).to have_text("Enter an email address")
  @world.journey.applicant_email_page.submit(
    email: "a@example.com",
    confirm_email: "b@example.com"
  )
  expect(@world.journey.applicant_email_page.error).to have_text("The email addresses you’ve entered don’t match")
  @world.journey.applicant_email_page.submit(
    email: reg[:applicant][:email],
    confirm_email: reg[:applicant][:email]
  )

  # Business type page
  @world.journey.business_type_page.submit_button.click
  expect(@world.journey.business_type_page.error).to have_text("You must answer this question")
  @world.journey.business_type_page.submit(business_type: reg[:business_type])

  # Company registration number page
  @world.journey.registration_number_page.submit_button.click
  expect(@world.journey.registration_number_page.error).to have_text("Enter a company registration number")
  @world.journey.registration_number_page.submit(registration_number: reg[:registration_number])

  # Operator name page
  @world.journey.operator_name_page.submit_button.click
  expect(@world.journey.operator_name_page.error).to have_text("You must enter a name")
  @world.journey.operator_name_page.submit(org_name: reg[:operator_name])

  # Operator address page
  expect(@world.journey.address_lookup_page.heading).to have_text("What's the company address?")
  # Generate errors on the address pages with the given text in the postcode field:
  generate_address_errors("ROSS KEMP")

  # Contact name page
  # The contact pages use the same logic as the applicant pages. Consider merging the page objects.
  @world.journey.contact_name_page.submit_button.click
  expect(@world.journey.contact_name_page.error).to have_text("You must enter a first name")
  expect(@world.journey.contact_name_page.error).to have_text("You must enter a last name")
  @world.journey.contact_name_page.submit(
    first_name: reg[:contact][:first_name],
    last_name: reg[:contact][:last_name]
  )

  # Contact position page has no 'empty field' validation
  expect(@world.journey.contact_position_page.heading).to have_text("What's their position?")
  @world.journey.contact_position_page.submit_button.click

  # Contact phone page
  @world.journey.contact_telephone_page.submit_button.click
  expect(@world.journey.contact_telephone_page.error).to have_text("Enter a telephone number")
  @world.journey.contact_telephone_page.submit(tel_no: reg[:contact][:telephone])

  # Contact email page
  @world.journey.contact_email_page.submit_button.click
  expect(@world.journey.contact_email_page.error).to have_text("Enter an email address")
  @world.journey.contact_email_page.submit(
    email: "a@example.com",
    confirm_email: "b@example.com"
  )
  expect(@world.journey.contact_email_page.error).to have_text("The email addresses you’ve entered don’t match")
  @world.journey.contact_email_page.submit(
    email: reg[:contact][:email],
    confirm_email: reg[:contact][:email]
  )

  # Contact address page
  expect(@world.journey.address_lookup_page.heading).to have_text("What's their postcode?")
  generate_address_errors("STEVE MCFADDEN")

  # On a farm page
  @world.journey.on_farm_page.submit_button.click
  expect(@world.journey.on_farm_page.error).to have_text("You must answer this question")
  @world.journey.on_farm_page.submit(on_farm: reg[:on_farm])

  # Is a farmer page
  @world.journey.farmer_page.submit_button.click
  expect(@world.journey.farmer_page.error).to have_text("You must answer this question")
  @world.journey.farmer_page.submit(farmer: reg[:farmer])

  # Site grid reference
  @world.journey.site_grid_reference_page.submit_button.click
  expect(@world.journey.site_grid_reference_page.error).to have_text("Enter a grid reference")
  expect(@world.journey.site_grid_reference_page.error).to have_text("Enter a site description")
  find_link("use an address instead").click
  generate_address_errors("JUNE BROWN")

  # Check your answer page doesn't have validation:
  expect(@world.journey.check_details_page.heading).to have_text("Check your answers")
  @world.journey.check_details_page.submit_button.click

  # Declaration page
  @world.journey.declaration_page.submit_button.click
  # rubocop:disable Metrics/LineLength
  expect(@world.journey.declaration_page.error).to have_text("You cannot register if you do not understand and agree with the declaration")
  # rubocop:enable Metrics/LineLength
  @world.journey.declaration_page.submit

end
