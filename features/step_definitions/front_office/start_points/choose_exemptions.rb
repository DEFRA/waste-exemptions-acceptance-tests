Given(/^I am on the choose exemptions page$/) do
  @app = App.new
  @app.front_office_home_page.load
  @app.registration_type_page.submit_new

  # Contact details page
  @app.contact_details_page.submit(
    full_name: "John Smith",
    tel_number: "01234567899",
    email: "tim.stone.ea@gmail.com",
    confirm_email: "tim.stone.ea@gmail.com"
  )

  @app.user_type_page.submit(org_type: "WasteExemptionsShared::OrganisationType::Individual")

  @app.organisation_name_page.submit(org_name: "Mr Test")

  @app.address_page.submit(
    postcode: "BS1 5AH",
    result: "ENVIRONMENT AGENCY, HORIZON HOUSE, DEANERY ROAD, BRISTOL, BS1 5AH"
  )

  @app.correspondence_contact_page.submit(
    full_name: "Mr Test",
    tel_number: "01234567899"
  )

  @app.farm_questions_page.submit

  @app.site_location_page.submit_grid_ref(
    grid_ref: "ST5820572708",
    site_details: "by a tree near a river there's a hole in the ground"
  )
end

When(/^I click continue$/) do
  @app.choose_exemptions_page.submit_button.click
end

Then(/^I click continue through the tabs without choosing an exemption$/) do

  @app.choose_exemptions_page.submit_button.click
  @app.choose_exemptions_page.submit_button.click
  @app.choose_exemptions_page.submit_button.click
  @app.choose_exemptions_page.submit_button.click
  @app.choose_exemptions_page.submit_button.click

end

When(/^I click continue on the last tab$/) do
  @app.choose_exemptions_page.submit(
    exemptions: %w[S1]
  )
end

Then(/^I will be on the "([^"]*)" tab$/) do |tab_title|

  expected_tab = @app.choose_exemptions_page.select_tab_by_title(tab_title)
  expect(expected_tab["class"]).to include("responsive-tabs__list__item--active")

end

Then(/^I will be shown a message prompting me to choose an exemption$/) do
  expect(@app.choose_exemptions_page).to have_text("You must make a selection from the list")
end
