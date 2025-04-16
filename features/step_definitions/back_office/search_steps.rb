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
