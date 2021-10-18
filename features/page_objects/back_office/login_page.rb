# frozen_string_literal: true

require_relative "base_page"

class LoginPage < BasePage

  set_url(Quke::Quke.config.custom["urls"]["back_office"])

  element(:alert_invalid, "div.alert-danger[role='alert']", text: "Invalid email or password")

  element(:email, "#user_email")
  element(:password, "#user_password")

  def submit(args = {})
    email.set(args[:email]) if args.key?(:email)
    password.set(args[:password]) if args.key?(:password)

    submit_button.click
  end

end
