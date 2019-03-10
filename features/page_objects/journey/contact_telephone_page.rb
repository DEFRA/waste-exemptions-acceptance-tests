# frozen_string_literal: true

class ContactTelephonePage < SitePrism::Page

  element(:tel_no, "#contact_phone_form_phone_number")

  element(:submit_button, "input[type='submit']")

  def submit(args = {})
    tel_no.set(args[:tel_no]) if args.key?(:tel_no)

    submit_button.click
  end

end
