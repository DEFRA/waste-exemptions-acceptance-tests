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
  if @world.email.local?
    Capybara.reset_session!
    @world.email.mailcatcher_main_page.load
    @world.email.mailcatcher_main_page.open_email(1)
    @world.email.mailcatcher_messages_page.accept_invite.click
  else
    # Use the built-in email API to access the link and accept the invite.
    # Need to be logged in for these steps to work.
    visit(Quke::Quke.config.custom["urls"]["back_office_email"])
    accept_url = @world.email.last_email_api_page.get_accept_url(@world.last_email).to_s
    # Reset the session, otherwise you stay logged in as a system user.
    Capybara.reset_session!
    visit(accept_url)
  end
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

When("I change a users role to super agent") do
  @world.bo.dashboard_page.admin_menu.user_management.click

  # This currently relies on the previous scenario to have generated a last_email.
  # Consider generating a value for this here to remove the dependency.
  # These tests will fail if there are more than 10 pages of users.
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
  @world.bo.users_page.look_for(@world.last_email)
  user = @world.bo.users_page.user_details(@world.last_email)
  expect(user.status).to have_text("deactivated")
end
