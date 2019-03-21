# frozen_string_literal: true

When(/^I am on the waste exemptions dashboard$/) do
  expect(@world.bo.dashboard_page).to have_text("Waste exemptions dashboard")
end

When(/^I invite a new back office user$/) do
  @world.last_email = generate_example_email(nil, nil)
  @world.bo.dashboard_page.admin_menu.user_management.click
  create_user(:system_user, @world.last_email)
  # Clears session otherwise invite link will not work
  Capybara.reset_session!
end

When(/^the invite is accepted$/) do
  if @world.email.local?
    @world.email.mailcatcher_main_page.load
    @world.email.mailcatcher_main_page.open_email(1)
    @world.email.mailcatcher_messages_page.accept_invite.click
  else
    @world.email.mailinator_page.load
    @world.email.mailinator_page.submit(inbox: @world.last_email)
    @world.email.mailinator_inbox_page.invite_email.click
    @world.email.mailinator_inbox_page.email_details do |frame|
      @world.last_window = window_opened_by { frame.accept_invite.click }
    end
  end
end

When(/^a password is set$/) do
  if @world.email.local?
    @world.bo.accept_page.submit(
      password: @world.default_password,
      confirm_password: @world.default_password
    )
  else
    within_window @world.last_window do
      # Not having a sleep seems to stop mailinator redirect
      sleep(1)
      @world.bo.accept_page.submit(
        password: @world.default_password,
        confirm_password: @world.default_password
      )
    end
  end

end

Then(/^the new back office user can sign in$/) do
  if @world.email.local?
    expect(@world.bo.dashboard_page).to have_text(@world.last_email)
  else
    within_window @world.last_window do
      expect(@world.bo.dashboard_page).to have_text(@world.last_email)
    end
  end
end

When("I change a users role to super agent") do
  @world.bo.dashboard_page.admin_menu.user_management.click
  @world.bo.users_page.change_user_role(@world.known_bo_user_email)
  expect(@world.bo.change_user_role_page).to have_text(@world.known_bo_user_email)
  @world.bo.change_user_role_page.submit(role: :super)
end

Then("I see their role has changed") do
  user = @world.bo.users_page.user_details(@world.known_bo_user_email)
  expect(user.role).to have_text("super agent")
end

When("I deactivate a user") do
  @world.bo.dashboard_page.admin_menu.user_management.click
  @world.bo.users_page.deactivate_user(@world.known_bo_user_email)
  expect(@world.bo.deactivate_user_page).to have_text(@world.known_bo_user_email)
  @world.bo.deactivate_user_page.submit
end

Then("I see their status has changed") do
  user = @world.bo.users_page.user_details(@world.known_bo_user_email)
  expect(user.status).to have_text("deactivated")
end
