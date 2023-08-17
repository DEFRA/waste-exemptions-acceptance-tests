# frozen_string_literal: true

require_relative "base_page"

class LoginPage < BasePage

  set_url(Quke::Quke.config.custom["urls"]["back_office"])

  element(:email, "#user-email-field")
  element(:password, "#user-password-field")
  element(:submit_button, "input[type='submit']")
  element(:sign_out, "a[href='/users/sign_out']")

  def submit(args = {})
    email.set(args[:email]) if args.key?(:email)
    password.set(args[:password]) if args.key?(:password)

    submit_button.click
  end

end
