# frozen_string_literal: true

class CheckRegisteredCompanyNamePage < BasePage

  # Is this your registered name and address?
  # rubocop:disable Layout/LineLength
  element(:confirm_company_details, "#check-registered-name-and-address-form-temp-use-registered-company-details-true-field", visible: false)
  element(:reject_company_details, "#check-registered-name-and-address-form-temp-use-registered-company-details-field", visible: false)
  element(:companies_house_number, ".govuk-heading-m:nth-child(1)")
  # rubocop:enable Layout/LineLength
  def submit(args = {})
    case args[:choice]
    when :reject
      reject_company_details.click
    when :confirm
      confirm_company_details.click
    end
    submit_button.click
  end

end
