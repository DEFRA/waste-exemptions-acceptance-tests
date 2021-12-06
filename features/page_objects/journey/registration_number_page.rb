# frozen_string_literal: true

class RegistrationNumberPage < BasePage

  element(:registration_number, "input[id^='registration-number-form-company-no-field']")

  def submit(args = {})
    registration_number.set(args[:registration_number]) if args.key?(:registration_number)
    submit_button.click
  end

end
