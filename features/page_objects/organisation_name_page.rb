class OrganisationNamePage < SitePrism::Page

  element(:org_name, "input[id='name']")

  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    org_name.set(args[:org_name]) if args.key?(:org_name)

    submit_button.click
  end

end
