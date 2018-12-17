Given(/^I am an individual$/) do
  @app.location_page.submit(location: :england)
  people = @app.applicant_name_page.applicant
  @app.applicant_name_page.submit(person: people[0])
  @app.applicant_phone_page.submit(tel_number: "0117 9000000")
  @app.applicant_email_page.submit(
    email: "tim.stone.ea@gmail.com",
    confirm_email: "tim.stone.ea@gmail.com"
  )
  @app.business_type_page.submit(business_type: :individual)
  @app.address_page.submit(
    postcode: "BS1 5AH",
    result: "NATURAL ENGLAND, HORIZON HOUSE, DEANERY ROAD, BRISTOL, BS1 5AH"
  )

  @app.organisation_name_page.submit(
    org_name: "Mr Test"
  )

end
