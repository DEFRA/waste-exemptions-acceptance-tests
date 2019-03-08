# frozen_string_literal: true

class CompanyNamePage < SitePrism::Page
  element(:company_name, "#name")
  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    company_name.set(args[:company_name]) if args.key?(:company_name)
    submit_button.click
  end

end
