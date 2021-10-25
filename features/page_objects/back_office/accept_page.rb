# frozen_string_literal: true

require_relative "base_page"

class AcceptPage < BasePage

  element(:password, "#user_password")
  element(:confirm_password, "#user_password_confirmation")
  element(:submit_button, "input[type='submit']")

  def submit(args = {})
    password.set(args[:password]) if args.key?(:password)
    confirm_password.set(args[:confirm_password]) if args.key?(:confirm_password)
    submit_button.click
  end

end
