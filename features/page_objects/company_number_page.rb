class CompanyNumberPage < SitePrism::Page
  element(:company_number, "#company_number")
  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    company_number.set(args[:company_number]) if args.key?(:company_number)
    submit_button.click
  end

end
