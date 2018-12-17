Given(/^I am a partnership$/) do
  @app.location_page.submit(location: :england)
  people = @app.applicant_name_page.applicant
  @app.applicant_name_page.submit(person: people[0])
  @app.applicant_phone_page.submit(tel_number: "0117 9000000")
  @app.applicant_email_page.submit(
    email: "tim.stone.ea@gmail.com",
    confirm_email: "tim.stone.ea@gmail.com"
  )
  @app.business_type_page.submit(business_type: :partnership)
  # Add first partner
  @app.add_partner_page.submit(
    name: "First test partner",
    postcode: "BS1 5AH"
  )

  @app.reviewing_partners_page.add_partner.click

  # Add second partner
  @app.add_partner_page.submit(
    name: "Second test partner",
    postcode: "BS1 5AH"
  )

  expect(page).to have_content "First test partner"
  expect(page).to have_content "Second test partner"

  @app.reviewing_partners_page.submit

end

When(/^I register an exemption for a|my partnership$/) do

  @app.correspondence_contact_page.submit(
    full_name: "Mr Test",
    premises: "Test house",
    tel_number: "01234567899"
  )

  @app.farm_questions_page.submit

  @app.site_location_page.submit_grid_ref(
    grid_ref: "ST5820572708",
    site_details: "by a tree near a river there's a hole in the ground"
  )

  @app.choose_exemptions_page.submit(
    exemptions: %w[D2 S1]
  )

  @app.check_details_page.submit
  @app.declaration_page.submit

end
