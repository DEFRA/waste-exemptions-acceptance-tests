# frozen_string_literal: true

class CheckContactNamePage < BasePage

  element(:accept, "#check-contact-name-form-temp-reuse-applicant-name-true-field+ .govuk-radios__label")
  element(:reject, "#check-contact-name-form-temp-reuse-applicant-name-field+ .govuk-radios__label")
  element(:phone_number, "#check-contact-name-form-temp-reuse-applicant-name-hint")

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
