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
  @world.bo.dashboard_page.admin_menu.home_page.click
  puts "Searching for registration #{registration}"
  @world.bo.dashboard_page.submit(search_term: registration)
end

Then("I see {string} in the results") do |expected_name|
  expect(page).to have_content(expected_name)
end

Then("I don't see {string}") do |unexpected_name|
  expect(page).not_to have_content(unexpected_name)
end

When("I view a registration's sites information") do
  # Last registration number is stored in @world.last_reg_no.
  # Search for the last reference number:
  @world.bo.dashboard_page.admin_menu.home_page.click
  @world.bo.dashboard_page.submit(search_term: @world.last_reg_no)
  find_link("View details").click
  expect(@world.bo.registration_details_page.heading).to have_text("Registration details for #{@world.last_reg_no}")

  @world.bo.registration_details_page.sites.click
end

When("I view the registrations details") do
  @world.bo.dashboard_page.admin_menu.home_page.click
  @world.bo.dashboard_page.submit(search_term: @world.last_reg_no)
  @world.bo.dashboard_page.view_link(@world.last_reg_no).click
end
