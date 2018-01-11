Given(/^I am a partnership$/) do

  # Contact details page
  @app.contact_details_page.submit(
    full_name: "John Smith",
    tel_number: "01234567899",
    email: "tim.stone.ea@gmail.com",
    confirm_email: "tim.stone.ea@gmail.com"
  )
  @app.user_type_page.submit(
    org_type: "WasteExemptionsShared::OrganisationType::Partnership"
  )
  # Add first partner
  @app.add_partner_page.submit(
    name: "First test partner",
    postcode: "S60 1BY"
  )

  @app.reviewing_partners_page.add_partner.click

  # Add second partner
  @app.add_partner_page.submit(
    name: "Second test partner",
    postcode: "S60 1BY"
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
