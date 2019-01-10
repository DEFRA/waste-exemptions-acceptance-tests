class ContactNamePage < SitePrism::Page

  element(:first_name, "#contact_name_form_first_name")
  element(:last_name, "#contact_name_form_last_name")

  element(:submit_button, "input[type='submit']")

  def submit(args = {})
    first_name.set(args[:first_name]) if args.key?(:first_name)
    last_name.set(args[:last_name]) if args.key?(:last_name)
    submit_button.click
  end

end
