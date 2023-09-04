# frozen_string_literal: true

class ContactPhonePage < BasePage

  element(:contact_phone, "#contact-phone-form-contact-phone-field")

  def submit(args = {})
    contact_phone.set(args[:contact_phone]) if args.key?(:contact_phone)

    submit_button.click
  end

end
