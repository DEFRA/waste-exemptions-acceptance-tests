# frozen_string_literal: true

When(/^I complete a registration using postcode (.*) for the site address$/) do |postcode|
  @app.search_page.nav_bar.registrations_menu.click
  @app.search_page.nav_bar.new_option.click

  @app.contact_details_page.submit(
    full_name: "Mr Test",
    tel_number: "01234567899",
    email: @email_address,
    confirm_email: @email_address
  )

  @app.user_type_page.submit(
    org_type: "WasteExemptionsShared::OrganisationType::Individual"
  )

  @app.operator_name_page.submit(
    org_name: "Mr Test"
  )

  @app.address_page.submit(
    postcode: "BS1 5AH",
    result: "NATURAL ENGLAND, HORIZON HOUSE, DEANERY ROAD, BRISTOL, BS1 5AH"
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
    exemptions: %w[D2 S1]
  )

  @app.check_details_page.submit
  @app.declaration_page.submit

  @exemption_number = @app.confirmation_page.ref_no.text

end

When(/^I complete a registration using a national grid reference (.*) for the site address$/) do |ngr|
  @app.search_page.nav_bar.registrations_menu.click
  @app.search_page.nav_bar.new_option.click

  @app.contact_details_page.submit(
    full_name: "Mr Test",
    tel_number: "01234567899",
    email: @email_address,
    confirm_email: @email_address
  )

  @app.user_type_page.submit(
    org_type: "WasteExemptionsShared::OrganisationType::Individual"
  )

  @app.operator_name_page.submit(
    org_name: "Mr Test"
  )

  @app.address_page.submit(
    postcode: "BS1 5AH",
    result: "NATURAL ENGLAND, HORIZON HOUSE, DEANERY ROAD, BRISTOL, BS1 5AH"
  )

  @app.correspondence_contact_page.submit(
    tel_number: "01234567899"
  )

  @app.farm_questions_page.submit(
    on_farm: false,
    farmer: false
  )

  @app.site_location_page.submit_grid_ref(
    grid_ref: ngr,
    site_details: "NGR area lookup test"
  )

  @app.choose_exemptions_page.submit(
    exemptions: %w[D2 S1]
  )

  @app.check_details_page.submit
  @app.declaration_page.submit

  @exemption_number = @app.confirmation_page.ref_no.text
end

Given(/^I have a registration with the exemptions "([^"]*)"$/) do |exemptions|

  @app.search_page.nav_bar.registrations_menu.click
  @app.search_page.nav_bar.new_option.click

  @app.contact_details_page.submit(
    full_name: "Mr Test",
    tel_number: "01234567899",
    email: @email_address,
    confirm_email: @email_address
  )

  @app.user_type_page.submit(
    org_type: "WasteExemptionsShared::OrganisationType::Individual"
  )

  @app.operator_name_page.submit(
    org_name: "Mr Test"
  )

  @app.address_page.submit(
    postcode: "BS1 5AH",
    result: "NATURAL ENGLAND, HORIZON HOUSE, DEANERY ROAD, BRISTOL, BS1 5AH"
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

Then(/^I will see the EA admin area is set to (.*)$/) do |area|
  @app.search_page.nav_bar.home_link.click
  @app.search_page.search_field.set @exemption_number
  @app.search_page.search_button.click
  @app.search_page.first_search_result.click
  @app.registration_page.site_details.expander_link.click
  expect(@app.registration_page.site_details.area.text).to include(area)
end

Then(/^I will see the national grid reference is set to (.*)$/) do |ngr|
  expect(@app.registration_page.site_details.grid_reference.text).to include(ngr)
end

When(/^I export registrations for today$/) do
  @app.search_page.nav_bar.registrations_menu.click
  @app.search_page.nav_bar.export_option.click

  # finds today's date and saves them for use in export from date
  # 'To' date defaults to today's date is isn't required
  time = Time.new

  @year = time.year
  @month = time.strftime("%B")
  @day = time.day

  @app.enrollment_exports_page.submit(
    from_day: @day,
    from_month: @month,
    from_year: @year
  )
  expect(@app.enrollment_exports_page).to have_export_alert
end

When(/^I export confirmation letters for today$/) do
  @app.search_page.nav_bar.registrations_menu.click
  @app.search_page.nav_bar.confirmation_letters.click

  # finds today's date and saves them for use in export from date
  # 'To' date defaults to today's date is isn't required
  time = Time.new

  @year = time.year
  @month = time.strftime("%B")
  @day = time.day

  @app.confirmation_letter_bulk_exports_page.submit(
    from_day: @day,
    from_month: @month,
    from_year: @year,
    to_day: @day,
    to_month: @month,
    to_year: @year
  )
  expect(@app.confirmation_letter_bulk_exports_page).to have_export_alert
end

Then(/^I will see the exported registrations file status as complete$/) do

  refresh_cnt = 0
  loop do
    if @app.enrollment_exports_page.latest_export_status.text == "Complete"
      refresh_cnt = 20
    else
      refresh_cnt += 1
      sleep(1)
      @app.enrollment_exports_page.refresh.click
    end
    break unless refresh_cnt < 20
  end

  expect(@app.enrollment_exports_page.latest_export_status.text).to eq("Complete")
end

Then(/^I will see the confirmation letter export is successfully completed$/) do

  refresh_cnt = 0
  loop do
    if @app.confirmation_letter_bulk_exports_page.latest_export_status.text == "Complete"
      refresh_cnt = 20
    else
      refresh_cnt += 1
      sleep(1)
      @app.confirmation_letter_bulk_exports_page.refresh.click
    end
    break unless refresh_cnt < 20
  end
  # Asserts export has been run and doesn't have any validation errors
  # if this is not run we could have a false postitive check of success
  expect(@app.confirmation_letter_bulk_exports_page.latest_export_status.text).to eq("Complete")
end

Then(/^I will see the filename of the export$/) do
  pending # Write code here that turns the phrase above into concrete actions
  # expect(@app.confirmation_letter_bulk_exports_page.latest_export_file.text).not_to eq("n/a")
end
