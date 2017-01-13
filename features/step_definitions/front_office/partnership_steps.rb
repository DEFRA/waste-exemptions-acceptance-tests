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
