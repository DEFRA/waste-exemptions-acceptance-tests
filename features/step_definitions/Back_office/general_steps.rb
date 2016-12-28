Given(/^I am an internal user$/) do

  @app = App.new

  @app.back_office_signin_page.load

  @app.back_office_signin_page.sign_in(
    user_email: 'tim.stone.ea@gmail.com',
    user_password: 'Abcde12345'
  )

end

When(/^I complete a registration$/) do
  @app.back_office_home_page.menu_registrations.click
  @app.back_office_home_page.menu_new_registration.click

  @app.contact_details_page.submit(
    full_name: 'Mr Test',
    tel_number: '01234567899',
    email: 'tim.stone.ea@gmail.com',
    confirm_email: 'tim.stone.ea@gmail.com'
  )

  @app.user_type_page.submit(
    org_type: 'WasteExemptionsShared::OrganisationType::Individual'
  )

  @app.organisation_name_page.submit(
    org_name: 'Mr Test'
  )

  @app.address_page.submit_address(
    postcode: 'BS1 5AH',
    result: 'ENVIRONMENT AGENCY, HORIZON HOUSE, DEANERY ROAD, BRISTOL, BS1 5AH'
  )

  @app.correspondence_contact_page.submit(
    tel_number: '01234567899'
  )

  @app.farm_questions_page.submit

  @app.site_location_page.submit_grid_ref(
    grid_ref: 'ST5820572708',
    site_details: "by a tree near a river there's a hole in the ground"
  )

  @app.choose_exemptions_page.submit(
    tab: :storing_waste,
    exemption: 'S1'
  )

  @app.check_details_page.submit
  @app.declaration_page.submit

  @exemption_number = @app.confirmation_page.ref_no.text

end

Then(/^I will be informed the registration is complete$/) do
  expect(page).to have_content 'Registration complete'

end
