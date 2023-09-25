# frozen_string_literal: true

class CaptureEmailPage < BasePage

  element(:contact_email, "input[id^='capture-email-form-contact-email-field']", visible: false)

  def submit(args = {})
    contact_email.set(args[:contact_email]) if args.key?(:contact_email)

    submit_button.click
  end
end
