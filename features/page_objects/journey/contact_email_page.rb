# frozen_string_literal: true

class ContactEmailPage < BasePage

  element(:contact_email, "#contact-email-form-contact-email-field")
  element(:confirmed_email, "#contact-email-form-confirmed-email-field")

  def submit(args = {})
    contact_email.set(args[:contact_email]) if args.key?(:contact_email)
    confirmed_email.set(args[:confirmed_email]) if args.key?(:confirmed_email)

    submit_button.click
  end

end
