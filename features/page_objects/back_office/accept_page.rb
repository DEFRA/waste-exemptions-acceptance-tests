# frozen_string_literal: true

require_relative "base_page"

class AcceptPage < BasePage

  element(:password, "#user-password-field")
  element(:confirm_password, "#user-password-confirmation-field")

  def submit(args = {})
    password.set(args[:password]) if args.key?(:password)
    confirm_password.set(args[:confirm_password]) if args.key?(:confirm_password)
    submit_button.click
  end

end
