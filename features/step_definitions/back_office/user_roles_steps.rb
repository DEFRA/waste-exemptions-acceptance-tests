# frozen_string_literal: true

Then(/^I will not have the option to manage users$/) do
  expect(@world.bo.dashboard_page.admin_menu).to have_no_user_management
end

Then("I can access the user management screen") do
  expect(@world.bo.dashboard_page.admin_menu).to have_user_management
  @world.bo.dashboard_page.admin_menu.user_management.click
  expect(page).to have_content("Manage back office users")
  expect(page).to have_current_path("/users")
end

Then("I can search for registrations") do
  @world.bo.dashboard_page.load
  @world.bo.dashboard_page.submit(search_term: "Mr Waste")
  expect(page).to have_content("Waste exemptions dashboard")
  # We know this should exist because of the registrations created in our
  # before(@data) hook
  expect(page).to have_content("Mr Waste")
end

Then("I cannot access the user management screen") do
  expect(@world.bo.dashboard_page.admin_menu).to have_no_user_management
  @world.bo.users_page.load
  expect(page).to have_content("Your account does not have permission")
  expect(page).to have_current_path("/pages/permission")
end

Then("I will have the option to create a new registration") do
  @world.bo.dashboard_page.load
  expect(@world.bo.dashboard_page).to have_create_new_registration
end

Then("I can access create a new registration") do
  visit(back_office_root_url("/start/new"))
  expect(page).to have_content("What do you want to do?")
  expect(page).to have_current_path("/start/new")
end

Then("I will not have the option to create a new registration") do
  @world.bo.dashboard_page.load
  expect(@world.bo.dashboard_page).to have_no_create_new_registration
end

Then("I cannot access create a new registration") do
  visit(back_office_root_url("/start/new"))
  expect(page).to have_content("Your account does not have permission")
  expect(page).to have_current_path("/pages/permission")
end
