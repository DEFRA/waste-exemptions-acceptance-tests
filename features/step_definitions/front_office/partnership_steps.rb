# frozen_string_literal: true

Given(/^I am a partnership$/) do
  @app.location_page.submit(location: :england)
  people = @app.applicant_name_page.applicant
  @app.applicant_name_page.submit(person: people[0])
  @app.applicant_phone_page.submit(tel_number: "0117 9000000")
  @app.applicant_email_page.submit(
    email: @email_address,
    confirm_email: @email_address
  )
  @app.business_type_page.submit(business_type: :partnership)
  people = @app.main_people_page.main
  @app.main_people_page.add_main_person(person: people[0])
  @app.main_people_page.submit(person: people[1])

  @app.operator_name_page.submit(
    org_name: "Test partnership"
  )
  @app.operator_address_page.submit(
    postcode: "BS1 5AH",
    result: "NATURAL ENGLAND, HORIZON HOUSE, DEANERY ROAD, BRISTOL, BS1 5AH"
  )
  @app.contact_name_page.submit(
    first_name: "Bob",
    last_name: "Cratchett"
  )
  @app.contact_position_page.submit(position: "Partner")
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
