# frozen_string_literal: true

class CheckContactEmailPage < BasePage

  element(:accept, "#check-contact-email-form-temp-reuse-applicant-email-true-field+ .govuk-radios__label")
  element(:reject, "#check-contact-email-form-temp-reuse-applicant-email-field+ .govuk-radios__label")
  element(:email, "#check-contact-email-form-temp-reuse-applicant-email-hint")

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
