# frozen_string_literal: true

class ContactEmailPage < SitePrism::Page

  element(:error, ".error-summary")

  element(:email, "#contact_email_form_contact_email")
  element(:confirm_email, "#contact_email_form_confirmed_email")

  element(:submit_button, "input[type='submit']")

  def submit(args = {})
    email.set(args[:email]) if args.key?(:email)
    confirm_email.set(args[:confirm_email]) if args.key?(:confirm_email)
    submit_button.click
  end

end
