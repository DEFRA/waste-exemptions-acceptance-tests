Given(/^I am an external user$/) do

  @app = App.new
  @app.front_office_home_page.load

end

Given(/^I select a new exemption$/) do
  @app.registration_type_page.submit_new
end

When(/^I register an exemption$/) do
  @app.organisation_name_page.submit(
    org_name: 'John Smith'
  )

  @app.address_page.submit_address(
    postcode: 'BS1 5AH',
    result: 'ENVIRONMENT AGENCY, HORIZON HOUSE, DEANERY ROAD, BRISTOL, BS1 5AH'
  )

  @app.correspondence_contact_page.submit(
    tel_number: '01234567899'
  )

  @app.farm_questions_page.submit

  @app.site_address_page.submit_grid_ref(
    grid_ref: 'ST1111111111',
    site_details: "by a tree near a river there's a hole in the ground"
  )

end
