# frozen_string_literal: true

class WasteExemptionEmailAddressPage < BasePage
  element(:email, "#capture-email-form-contact-email-field")

  def submit(args = {})
    email.set(args[:email]) if args.key?(:email)
    submit_button.click
  end

end
