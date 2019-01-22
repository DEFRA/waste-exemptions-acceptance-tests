Given(/^I am a limited liability partnership$/) do
  @app.location_page.submit(location: :england)
  people = @app.applicant_name_page.applicant
  @app.applicant_name_page.submit(person: people[0])
  @app.applicant_phone_page.submit(tel_number: "0117 9000000")
  @app.applicant_email_page.submit(
    email: @email_address,
    confirm_email: @email_address
  )
  @app.business_type_page.submit(business_type: :llp)
  @app.registration_number_page.submit(
    registration_number: "00445790"
  )
  @app.operator_name_page.submit(
    org_name: "Test LLP"
  )
  @app.operator_address_page.submit_manual_address(
    postcode: "BS1 5AH",
    house_no: "1",
    address_line_one: "test lane",
    address_line_two: "teston",
    city: "testville"
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
end
