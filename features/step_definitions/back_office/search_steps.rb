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

When("I search for the registration") do
  registration = @world.last_reg_no
  @world.bo.dashboard_page.submit(search_term: registration)
end

Then("I see {string} in the results") do |expected_name|
  expect(page).to have_content(expected_name)
end

Then("I don't see {string}") do |unexpected_name|
  expect(page).not_to have_content(unexpected_name)
end

And("refreshing doesn't create new registrations") do
  # Search for the applicant name from the last unsubmitted registration
  last_reg_no = @world.known_reg_no.to_s.scan(/\d+/)[0].to_s
  @world.bo.dashboard_page.submit(search_term: last_reg_no.to_s)
  last_reg_no_number = last_reg_no.to_i
  puts "#{last_reg_no} is the latest known registration"

  # Refresh the start page. This should generate no more than one new registration.
  find_link("Start a new registration").click
  20.times do
    page.evaluate_script "window.location.reload()"
  end

  # Work out the registration 2 numbers higher than the previous registration
  # by recreating the expected WEX number with 6 digits: regex %06d
  last_reg_no_plus = "WEX#{format('%<number>06d', number: last_reg_no_number + 2)}"

  # Search for the higher registration number and check it doesn't exist:
  find_link("Dashboard").click
  @world.bo.dashboard_page.unsubmitted_filter.click
  @world.bo.dashboard_page.submit(search_term: last_reg_no_plus)
  expect(@world.bo.dashboard_page).to have_no_results
end
