# frozen_string_literal: true

When(/^I complete an LLPs registration$/) do
  @email_address = generate_email
  @app.registration_dashboard_page.create_new_registration.click
  @app.registration_type_page.submit_new
  @app.location_page.submit(location: :england)
  people = @app.applicant_name_page.applicant
  @app.applicant_name_page.submit(person: people[0])
  @app.applicant_phone_page.submit(tel_number: "0117 9000000")
  @app.applicant_email_page.submit(
    email: @email_address,
    confirm_email: @email_address
  )
  @app.business_type_page.submit(business_type: :local_authority)
  @app.operator_name_page.submit(
    org_name: "Test LA"
  )
  @app.operator_address_page.submit(
    postcode: "BS1 5AH",
    result: "NATURAL ENGLAND, HORIZON HOUSE, DEANERY ROAD, BRISTOL, BS1 5AH"
  )
  @app.contact_name_page.submit(
    first_name: "Bob",
    last_name: "Cratchett"
  )
  @app.contact_position_page.submit(position: "Manager")
  @app.contact_telephone_page.submit(tel_no: "0117 9000000")
  @app.contact_email_page.submit(
    email: @email_address,
    confirm_email: @email_address
  )
  @app.contact_address_page.submit(
    postcode: "BS1 5AH",
    result: "NATURAL ENGLAND, HORIZON HOUSE, DEANERY ROAD, BRISTOL, BS1 5AH"
  )
  @app.on_farm_page.submit(on_farm: true)
  @app.farmer_page.submit(farmer: true)
  @app.site_grid_reference_page.submit(
    grid_ref: "ST 58132 72695",
    site_details: "Yer it is"
  )
  @app.choose_exemptions_page.submit(
    exemptions: %w[S1]
  )
  @app.check_details_page.submit
  @app.declaration_page.submit

  # Stores the exemption number so the exemption can be edited in later steps
  @exemption_number = @app.confirmation_page.ref_no.text
end
