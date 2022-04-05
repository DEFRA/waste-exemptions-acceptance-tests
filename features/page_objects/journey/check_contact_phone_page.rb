# frozen_string_literal: true

class CheckContactPhonePage < BasePage

  element(:accept, "#check-contact-phone-form-temp-reuse-applicant-phone-true-field+ .govuk-radios__label")
  element(:reject, "#check-contact-phone-form-temp-reuse-applicant-phone-field+ .govuk-radios__label")
  element(:phone_number, "#check-contact-phone-form-temp-reuse-applicant-phone-hint")

  def submit(args = {})
    case args[:reuse]
    when :accept
      accept.click
    when :reject
      reject.click
    end

    submit_button.click
  end

end
