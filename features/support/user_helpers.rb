# frozen_string_literal: true

def create_user(type, email, load_root_page: true)
  @world.bo.users_page.load if load_root_page
  @world.bo.users_page.invite_user.click
  @world.bo.invitation_page.submit(user_email: email, type: type)
end

def login_user(user_email)
  Capybara.reset_session!
  # Set app to back office, to determine which email service to call later:
  @app = :bo
  @world.bo.login_page.load
  # Back office login page
  @world.bo.login_page.submit(
    email: user_email,
    password: @world.default_password
  )
end
