# frozen_string_literal: true

class RegistrationNumberPage < SitePrism::Page
  element(:registration_number, "#registration_number_form_company_no")

  element(:submit_button, "input[type='submit']")

  def submit(args = {})
    registration_number.set(args[:registration_number]) if args.key?(:registration_number)
    submit_button.click
  end

end
