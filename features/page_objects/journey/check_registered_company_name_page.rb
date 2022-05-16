# frozen_string_literal: true

class CheckRegisteredCompanyNamePage < BasePage

  # Is this your registered name and address?
  element(:confirm_company_details, "input[value='true']", visible: false)
  element(:reject_company_details, "input[value='false']", visible: false)
  element(:companies_house_number, ".govuk-heading-m:nth-child(1)")

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
