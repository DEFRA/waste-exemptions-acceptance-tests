# frozen_string_literal: true

When(/^I am on the waste exemptions dashboard$/) do
  expect(@app.registration_dashboard_page).to have_text("Waste exemptions dashboard")
end

Then(/^I will not have the option to manage users$/) do
  expect(@app.registration_dashboard_page.govuk_banner).to have_no_user_management
end

When(/^I invite a new back office user$/) do
  @app.registration_dashboard_page.govuk_banner.user_management.click
  @app.users_page.invite_user.click
  @email_address = generate_email
  @app.invitation_page.submit(
    user_email: @email_address,
    type: :system_user
  )
  # Clears session otherwise invite link will not work
  Capybara.reset_session!
end

When(/^the invite is accepted$/) do
  if @email_app.local?
    @email_app.mailcatcher_main_page.load
    @email_app.mailcatcher_main_page.open_email(1)
    @email_app.mailcatcher_messages_page.accept_invite.click
  else
    @email_app.mailinator_page.load
    @email_app.mailinator_page.submit(inbox: @email_address)
    @email_app.mailinator_inbox_page.invite_email.click
    @email_app.mailinator_inbox_page.email_details do |frame|
      @new_window = window_opened_by { frame.accept_invite.click }
    end

  end
end

When(/^a password is set$/) do
  if @email_app.local?
    @app.accept_page.submit(
      password: ENV["WEX_DEFAULT_PASSWORD"],
      confirm_password: ENV["WEX_DEFAULT_PASSWORD"]
    )
  else
    within_window @new_window do
      # Not having a sleep seems to stop mailinator redirect
      sleep(1)
      @app.accept_page.submit(
        password: ENV["WEX_DEFAULT_PASSWORD"],
        confirm_password: ENV["WEX_DEFAULT_PASSWORD"]
      )
    end
  end

end

Then(/^the new back office user can sign in$/) do
  if @email_app.local?
    expect(@app.registration_dashboard_page).to have_text(@email)
  else
    within_window @new_window do
      expect(@app.registration_dashboard_page).to have_text(@email)
    end
  end
end
