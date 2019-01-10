class OperatorNamePage < SitePrism::Page

  element(:org_name, "#operator_name_form_operator_name", visible: false)

  element(:submit_button, "input[type='submit']")

  def submit(args = {})
    org_name.set(args[:org_name]) if args.key?(:org_name)

    submit_button.click
  end

end
