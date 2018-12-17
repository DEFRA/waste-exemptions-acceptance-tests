Given(/^I am a limited company$/) do
  @app.location_page.submit(location: :england)
  people = @app.applicant_name_page.applicant
  @app.applicant_name_page.submit(person: people[0])
  @app.applicant_phone_page.submit(tel_number: "0117 9000000")
  @app.applicant_email_page.submit(
    email: "tim.stone.ea@gmail.com",
    confirm_email: "tim.stone.ea@gmail.com"
  )
  @app.business_type_page.submit(business_type: :limited)

  @app.company_number_page.submit(
    company_number: "12345678"
  )

  @app.company_name_page.submit(
    company_name: "Testing limited"
  )
end
