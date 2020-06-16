# frozen_string_literal: true

Then("I can access the user management screen") do
  expect(@world.bo.dashboard_page.admin_menu).to have_user_management
  @world.bo.dashboard_page.admin_menu.user_management.click
  expect(page).to have_content("Manage back office users")
  expect(page).to have_current_path("/users")
end

Then(/^I will not have the option to manage users$/) do
  expect(@world.bo.dashboard_page.admin_menu).to have_no_user_management
end

Then("I can search for registrations") do
  find_link("Waste exemptions back office").click
  @world.bo.dashboard_page.submit(search_term: @world.known_reg_no)
  expect(page).to have_content("Waste exemptions dashboard")
  # We know results should exist because of the registrations created in our
  # before(@data) hook
  expect(@world.bo.dashboard_page).to have_results
  expect(page).to have_content("Mr Waste")
end

Then("I cannot access the user management screen") do
  expect(@world.bo.dashboard_page.admin_menu).to have_no_user_management
  visit(back_office_root_url("/users"))
  expect(page).to have_content("Your account does not have permission")
  expect(page).to have_current_path("/pages/permission")
end

Then("I will have the option to create a new registration") do
  find_link("Waste exemptions back office").click
  expect(@world.bo.dashboard_page).to have_create_new_registration
end

Then("I can access create a new registration") do
  visit(back_office_root_url("/start.new"))
  expect(page).to have_content("What do you want to do?")
  expect(page).to have_current_path("/start.new")
end

Then("I will not have the option to create a new registration") do
  find_link("Waste exemptions back office").click
  expect(@world.bo.dashboard_page).to have_no_create_new_registration
end

Then("I cannot access create a new registration") do
  visit(back_office_root_url("/start.new"))
  expect(page).to have_content("Your account does not have permission")
  expect(page).to have_current_path("/pages/permission")
end

Then("I can view their details") do
  @world.bo.dashboard_page.view_link(@world.known_reg_no).click
  expect(page).to have_content("Registration details for")
  # rubocop:disable Style/RedundantRegexpEscape
  expect(page).to have_current_path(%r{^\/registrations\/WEX})
  # rubocop:enable Style/RedundantRegexpEscape
end

Then("I can continue an in progress registration") do
  find_link("Waste exemptions back office").click
  @world.bo.dashboard_page.unsubmitted_filter.click
  @world.bo.dashboard_page.submit(search_term: "Mr Waste")
  @world.bo.dashboard_page.resume_links[0].click
  expect(page).to have_content("Who should we contact about this waste exemption operation?")
end

Then("I cannot continue an in progress registration") do
  find_link("Waste exemptions back office").click
  @world.bo.dashboard_page.unsubmitted_filter.click
  @world.bo.dashboard_page.submit(search_term: "Mr Waste")
  expect(@world.bo.dashboard_page.resume_links.count).to eq(0)
end

Then("I can access data exports") do
  find_link("Waste exemptions back office").click
  expect(@world.bo.dashboard_page.admin_menu).to have_data_exports

  @world.bo.dashboard_page.admin_menu.data_exports.click
  # The following sleep is required for running headlessly.
  # If not included, then the next assertion fails because the page title doesn't change straight away.
  # There are no other unique page objects on the Data Exports page which don't exist
  # on the previous page, and stay constant.
  sleep(2)
  expect(page.title).to eq("Data Exports - Register your waste exemptions - GOV.UK")
end

Then("I can download letters") do
  @world.bo.dashboard_page.admin_menu.download_letters_link.click
  find_link("Renewal letters").click
  expect(@world.journey.standard_page.heading).to have_text("Renewal letters for assisted digital")
  expect(@world.journey.standard_page.content).to have_text("Number of letters")
end

Then("I cannot download letters") do
  expect(@world.bo.dashboard_page.admin_menu).to have_no_download_letters_link
end
