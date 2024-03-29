# frozen_string_literal: true

When(/^I am on the waste exemptions dashboard$/) do
  expect(@world.bo.dashboard_page).to have_text("Waste exemptions dashboard")
end

When(/^I invite a new back office user$/) do
  @world.last_email = generate_example_email(nil, nil)
  @world.bo.dashboard_page.admin_menu.user_management.click
  create_user(:system_user, @world.last_email)
end

When(/^the invite is accepted$/) do
  # Use the built-in email API to access the link and accept the invite.
  # Need to be logged in for these steps to work.
  visit(Quke::Quke.config.custom["urls"]["notify_link"])
  accept_url = @world.journey.last_message_page.get_accept_url(@world.last_email).to_s
  # Reset the session, otherwise you stay logged in as a system user.
  Capybara.reset_session!
  visit(accept_url)
end

When(/^a password is set$/) do
  @world.bo.accept_page.submit(
    password: @world.default_password,
    confirm_password: @world.default_password
  )
end

Then(/^the new back office user can sign in$/) do
  expect(@world.bo.dashboard_page).to have_text(@world.last_email)
end

Then("the new back office user cannot change their password") do
  # Not yet implemented. Make this into a positive test when RUBY-416 is delivered.
  expect(@world.bo.dashboard_page).not_to have_text("Change password")

  # To add once RUBY-416 is implemented:
  # find_link("Change password").click
  # new_password = "Change" + rand(10_000..99_999).to_s
  # Submit an invalid password on the password page
  # Submit the new password on the password page
  # Go back, log out and back in with the new password
  # As this is a disposable user, we don't need to change the password back.

end

When("I change a users role to super agent") do
  @world.bo.dashboard_page.admin_menu.user_management.click

  # This currently relies on the previous scenario to have generated a last_email.
  # Consider generating a value for this here to remove the dependency.
  # These tests will fail if there are more than X pages of users where X is in users_page.
  @world.bo.users_page.look_for(@world.last_email)
  @world.bo.users_page.change_user_role(@world.last_email)
  expect(@world.bo.change_user_role_page).to have_text(@world.last_email)
  @world.bo.change_user_role_page.submit(role: :super)
end

Then("I see their role has changed") do
  @world.bo.users_page.look_for(@world.last_email)
  user = @world.bo.users_page.user_details(@world.last_email)
  expect(user.role).to have_text("super agent")
end

When("I deactivate a user") do
  @world.bo.dashboard_page.admin_menu.user_management.click
  @world.bo.users_page.look_for(@world.last_email)
  @world.bo.users_page.deactivate_user(@world.last_email)
  expect(@world.bo.deactivate_user_page).to have_text(@world.last_email)
  @world.bo.deactivate_user_page.submit
end

Then("I see their status has changed") do
  @world.bo.users_page.show_all_users.click
  @world.bo.users_page.look_for(@world.last_email)
  user = @world.bo.users_page.user_details(@world.last_email)
  expect(user.status).to have_text("deactivated")
end
