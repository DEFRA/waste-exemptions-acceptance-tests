class UserTypePage < SitePrism::Page

  elements(:org_types, "input[name='enrollment[organisation_attributes][type]']")

  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    if args.key?(:org_type)
      org_types.find { |btn| btn.value == args[:org_type] }.click
    end

    submit_button.click
  end

end
