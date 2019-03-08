# frozen_string_literal: true

Given(/^I am an individual$/) do
  @app.location_page.submit(location: :england)
  people = @app.applicant_name_page.applicant
  @app.applicant_name_page.submit(person: people[0])
  @app.applicant_phone_page.submit(tel_number: "0117 9000000")
  @app.applicant_email_page.submit(
    email: @email_address,
    confirm_email: @email_address
  )
  @app.business_type_page.submit(business_type: :individual)
  @app.operator_name_page.submit(
    org_name: "Mr Waste"
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
  @app.site_grid_reference_page.choose_address.click
  @app.site_address_page.submit(
    postcode: "BS1 5AH",
    result: "NATURAL ENGLAND, HORIZON HOUSE, DEANERY ROAD, BRISTOL, BS1 5AH"
  )
end
