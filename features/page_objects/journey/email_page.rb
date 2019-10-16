# frozen_string_literal: true

class EmailPage < SitePrism::Page

  element(:error, ".error-summary")

  element(:email, "#applicant_email_form_applicant_email,#contact_email_form_contact_email")
  element(:confirm_email, "input[id*='confirmed_email']")

  element(:submit_button, "input[type='submit']")

  def submit(args = {})
    email.set(args[:email]) if args.key?(:email)
    confirm_email.set(args[:confirm_email]) if args.key?(:confirm_email)

    submit_button.click
  end

end
