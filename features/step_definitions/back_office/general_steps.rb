Given(/^I have a valid username and password$/) do

  # Back office login page
  @app.login_page.submit(
    email: "tim.stone.ea@gmail.com",
    password: "Abcde12345"
  )

end

# rubocop:disable Metrics/BlockLength
When(/^I complete a registration$/) do

  @app.search_page.nav_bar.registrations_menu.click
  @app.search_page.nav_bar.new_option.click

  @app.contact_details_page.submit(
    full_name: "Mr Test",
    tel_number: "01234567899",
    email: "tim.stone.ea@gmail.com",
    confirm_email: "tim.stone.ea@gmail.com"
  )

  @app.user_type_page.submit(
    org_type: "WasteExemptionsShared::OrganisationType::Individual"
  )

  @app.organisation_name_page.submit(
    org_name: "Mr Test"
  )

  @app.address_page.submit_address(
    postcode: "BS1 5AH",
    result: "ENVIRONMENT AGENCY, HORIZON HOUSE, DEANERY ROAD, BRISTOL, BS1 5AH"
  )

  @app.correspondence_contact_page.submit(
    tel_number: "01234567899"
  )

  @app.farm_questions_page.submit

  @app.site_location_page.submit_grid_ref(
    grid_ref: "ST5820572708",
    site_details: "by a tree near a river there's a hole in the ground"
  )

  @app.choose_exemptions_page.submit(
    tab: :storing_waste,
    exemption: "S1"
  )

  @app.check_details_page.submit
  @app.declaration_page.submit

  @exemption_number = @app.confirmation_page.ref_no.text

end

When(/^I complete a registration using a postcode for site address$/) do
  @app.search_page.menu_registrations.click
  @app.search_page.menu_new_registration.click

  @app.contact_details_page.submit(
    full_name: "Mr Test",
    tel_number: "01234567899",
    email: "tim.stone.ea@gmail.com",
    confirm_email: "tim.stone.ea@gmail.com"
  )

  @app.user_type_page.submit(
    org_type: "WasteExemptionsShared::OrganisationType::Individual"
  )

  @app.organisation_name_page.submit(
    org_name: "Mr Test"
  )

  @app.address_page.submit_address(
    postcode: "BS1 5AH",
    result: "ENVIRONMENT AGENCY, HORIZON HOUSE, DEANERY ROAD, BRISTOL, BS1 5AH"
  )

  @app.correspondence_contact_page.submit(
    tel_number: "01234567899"
  )

  @app.farm_questions_page.submit

  @app.site_location_page.submit_address(
    postcode: "BS1 5AH",
    result: "ENVIRONMENT AGENCY, HORIZON HOUSE, DEANERY ROAD, BRISTOL, BS1 5AH"
  )

  @app.choose_exemptions_page.submit(
    tab: :storing_waste,
    exemption: "S1"
  )

  @app.check_details_page.submit
  @app.declaration_page.submit

  @exemption_number = @app.confirmation_page.ref_no.text
end

Then(/^I will be able to check what the National Grid Reference is for the site$/) do
  @app.search_page.menu_home.click
  @app.search_page.search_field.set @exemption_number
  @app.search_page.search_button.click
  @app.search_page.first_search_result.click
  @app.registration_details_page.site_location_details_section.click
  expect(@app.registration_details_page.ngr.text).to include("ST5820572708")
end
# rubocop:enable Metrics/BlockLength
