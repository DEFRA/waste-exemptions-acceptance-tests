# frozen_string_literal: true

class WasteExemptionNumberPage < BasePage
  element(:email, "#capture-reference-form-reference-field")

  def submit(args = {})
    email.set(args[:registration_number]) if args.key?(:registration_number)
    submit_button.click
  end

end
