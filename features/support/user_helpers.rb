# frozen_string_literal: true

def create_user(type, email, load_root_page: true)
  @world.bo.users_page.load if load_root_page
  @world.bo.users_page.invite_user.click
  @world.bo.invitation_page.submit(user_email: email, type: type)
end

def login_user(user_email)
  # Set app to back office, to determine which email service to call later:
  @app = :bo
  @world.bo.login_page.load
  heading = @world.bo.login_page.heading.text
  sign_out_of_back_office if heading != "Sign in"
  # Back office login page
  @world.bo.login_page.submit(
    email: user_email,
    password: @world.default_password
  )
  # Wait for the dashboard sign-out link to confirm login completed before continuing.
  # Without this wait, Chrome's redirect can race the next visit() call, leaving
  # the session unestablished and causing intermittent "Test data creation failed".
  @world.bo.dashboard_page.wait_until_sign_out_visible
end

def sign_out_of_back_office
  # Check not already signed out
  visit(Quke::Quke.config.custom["urls"]["back_office"])
  heading = @world.bo.login_page.heading.text

  # Bypass if already logged out:
  return if heading != "Waste exemptions dashboard"

  @world.bo.dashboard_page.sign_out.click
  expect(@world.bo.login_page.heading).to have_text("Sign in")
end
