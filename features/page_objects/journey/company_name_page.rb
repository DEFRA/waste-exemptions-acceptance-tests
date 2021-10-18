# frozen_string_literal: true

class CompanyNamePage < BasePage

  element(:company_name, "#name")

  def submit(args = {})
    company_name.set(args[:company_name]) if args.key?(:company_name)
    submit_button.click
  end

end
