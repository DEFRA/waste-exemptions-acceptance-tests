# frozen_string_literal: true

When("The {string} search filter is selected") do |filter|
  @world.bo.dashboard_page.submitted_filter.click if filter == "submitted"
  @world.bo.dashboard_page.unsubmitted_filter.click if filter == "unsubmitted"
end

When("I search for {string}") do |term|
  # If using a known registration, take the details generated from features/support/data_generator.rb
  term = @world.known_reg_no.to_s if term == "a known registration"
  @world.bo.dashboard_page.submit(search_term: term)
end

Then("I see {string} in the results") do |expected_name|
  expect(page).to have_content(expected_name)
end

Then("I don't see {string}") do |unexpected_name|
  expect(page).not_to have_content(unexpected_name)
end

Then("I can see confirmation letter links") do
  expect(@world.bo.dashboard_page.confirmation_letter_links.count.positive?).to eq(true)
end

And("refreshing doesn't create new registrations") do
  # Search for the applicant name from the last unsubmitted registration
  last_reg_no = @world.known_reg_no.to_s.scan(/\d+/)[0].to_s
  @world.bo.dashboard_page.submit(search_term: last_reg_no.to_s)
  last_reg_no_number = last_reg_no.to_i
  puts last_reg_no + " is the latest known registration"

  # Refresh the start page. This should generate no more than one new registration.
  # find_link("Waste exemptions back office").click
  find_link("Start a new registration").click
  20.times do
    page.evaluate_script "window.location.reload()"
  end

  # Work out the registration 2 numbers higher than the previous registration
  # by recreating the expected WEX number with 6 digits: regex %06d
  last_reg_no_plus = "WEX" + format("%06d", last_reg_no_number + 2)

  # Search for the higher registration number and check it doesn't exist:
  find_link("Dashboard").click
  @world.bo.dashboard_page.unsubmitted_filter.click
  @world.bo.dashboard_page.submit(search_term: last_reg_no_plus)
  expect(@world.bo.dashboard_page).to have_no_results

end

Then("I can see a confirmation letter for a known registration") do
  # As we cannot directly read PDFs through web test automation, use a dedicated URL to view the content as HTML:
  # Also, when testing headlessly, the direct link to the PDF (first confirmation letter link) doesn't work.
  # So we need to bypass the PDF link by going directly to the HTML version of the link.
  # Get target URL from first confirmation letter link and use this to go to the HTML version:
  letter_html_url = @world.bo.dashboard_page.confirmation_letter_links.first[:href].to_s + "?show_as_html=true"
  visit(letter_html_url)

  # Check confirmation letter with what's been generated in features/support/data_generator.rb :
  expect(@world.bo.confirmation_letter_page.heading).to have_text("Confirmation of waste exemption registration")
  expect(@world.bo.confirmation_letter_page.heading_ref).to have_text("Your reference: " + @world.known_reg_no.to_s)
  page_content = @world.bo.confirmation_letter_page.content
  expect(page_content).to have_text(@world.known_submitted_applicant) # known applicant's full name
  expect(page_content).to have_text("Business or organisation type: Individual or sole trader")
  expect(page_content).to have_text("waste wood and waste plant matter by chipping, shredding, cutting or pulverising")
end

Then("I cannot see a confirmation letter") do
  expect(@world.bo.dashboard_page.confirmation_letter_links.count).to eq(0)
end
