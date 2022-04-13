# frozen_string_literal: true

class CheckSiteAddressPage < BasePage
  # rubocop:disable Layout/LineLength
  element(:operator_address, "#check-site-address-form-temp-reuse-address-for-site-location-operator-address-option-field+ .govuk-radios__label")
  element(:contact_address, "#check-site-address-form-temp-reuse-address-for-site-location-contact-address-option-field+ .govuk-radios__label")
  element(:different_address, "#check-site-address-form-temp-reuse-address-for-site-location-a-different-address-field+ .govuk-radios__label")
  # rubocop:enable Layout/LineLength
  def submit(args = {})
    case args[:choice]
    when :operator_address_reuse
      operator_address.click
    when :contact_address_reuse
      contact_address.click
    when :use_different_address
      different_address.click
    end

    submit_button.click
  end

end
