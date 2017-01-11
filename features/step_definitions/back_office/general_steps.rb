Given(/^I have a valid username and password$/) do

  # Back office login page
  @app.login_page.submit(
    email: "tim.stone.ea@gmail.com",
    password: "Abcde12345"
    #email: "super_agent_user@example.gov.uk",
    #password: "Password123"
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

  @app.address_page.submit(
    postcode: "BS1 5AH",
    result: "ENVIRONMENT AGENCY, HORIZON HOUSE, DEANERY ROAD, BRISTOL, BS1 5AH"
  )

  @app.correspondence_contact_page.submit(
    tel_number: "01234567899"
  )

  @app.farm_questions_page.submit(
    on_farm: false,
    farmer: false
  )

  @app.site_location_page.submit_grid_ref(
    grid_ref: "ST5820572708",
    site_details: "by a tree near a river there's a hole in the ground"
  )

  @app.choose_exemptions_page.submit(
    exemptions: %w(S1 D2)
  )

  @app.check_details_page.submit
  @app.declaration_page.submit

  # Stores the exemption number so the exemption can be edited in later steps
  @exemption_number = @app.confirmation_page.ref_no.text

end
# rubocop:enable Metrics/BlockLength

# rubocop:disable Metrics/BlockLength
When(/^I complete a registration using postcode (.*) for the site address$/) do |postcode|
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

  @app.address_page.submit(
    postcode: "BS1 5AH",
    result: "ENVIRONMENT AGENCY, HORIZON HOUSE, DEANERY ROAD, BRISTOL, BS1 5AH"
  )

  @app.correspondence_contact_page.submit(
    tel_number: "01234567899"
  )

  @app.farm_questions_page.submit(
    on_farm: false,
    farmer: false
  )

  @app.site_location_page.submit_address(
    postcode: postcode
  )

  @app.choose_exemptions_page.submit(
    exemptions: %w(S1 D2)
  )

  @app.check_details_page.submit
  @app.declaration_page.submit

  @exemption_number = @app.confirmation_page.ref_no.text

end
# rubocop:enable Metrics/BlockLength

# rubocop:disable Metrics/BlockLength
Given(/^I have a registration with the exemptions "([^"]*)"$/) do |exemptions|

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

  @app.address_page.submit(
    postcode: "BS1 5AH",
    result: "ENVIRONMENT AGENCY, HORIZON HOUSE, DEANERY ROAD, BRISTOL, BS1 5AH"
  )

  @app.correspondence_contact_page.submit(
    tel_number: "01234567899"
  )

  @app.farm_questions_page.submit(
    on_farm: false,
    farmer: false
  )

  @app.site_location_page.submit_grid_ref(
    grid_ref: "ST5820572708",
    site_details: "by a tree near a river there's a hole in the ground"
  )

  # This line takes a value like this "S1, D3, U7" and converts it into an array
  # ["S1", "D3", "U7"] (the .map!(&:strip) bit removes the whitespace)
  selected_exemptions = exemptions.split(",").map!(&:strip)
  @app.choose_exemptions_page.submit(
    exemptions: selected_exemptions
  )

  @app.check_details_page.submit
  @app.declaration_page.submit

  # Stores the exemption number so the exemption can be edited in later steps
  @exemption_number = @app.confirmation_page.ref_no.text

end
# rubocop:enable Metrics/BlockLength

Then(/^I will see the site's National Grid Reference has been automatically found to be (.*)$/) do |ngr|
  @app.search_page.nav_bar.home_link.click
  @app.search_page.search_field.set @exemption_number
  @app.search_page.search_button.click
  @app.search_page.first_search_result.click
  @app.registration_page.site_details.expander_link.click
  expect(@app.registration_page.site_details.grid_reference.text).to include(ngr)
end

And(/^I will see the EA admin area is set to (.*)$/) do |area|
  expect(@app.registration_page.site_details.area.text).to include(area)
end
