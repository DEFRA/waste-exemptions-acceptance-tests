# frozen_string_literal: true

class CheckContactAddressPage < BasePage

  element(:accept, "#check-contact-address-form-temp-reuse-operator-address-true-field+ .govuk-radios__label")
  element(:reject, "#check-contact-address-form-temp-reuse-operator-address-field+ .govuk-radios__label")
  element(:address, "#check-contact-address-form-temp-reuse-operator-address-hint")

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
