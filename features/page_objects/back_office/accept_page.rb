# frozen_string_literal: true

class AcceptPage < SitePrism::Page

  element(:password, "#user_password")
  element(:confirm_password, "#user_password_confirmation")

  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    password.set(args[:password]) if args.key?(:password)
    confirm_password.set(args[:confirm_password]) if args.key?(:confirm_password)
    submit_button.click
  end

end
