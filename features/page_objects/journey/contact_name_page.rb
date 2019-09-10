# frozen_string_literal: true

class ContactNamePage < SitePrism::Page

  # consider merging this with applicant_email

  element(:error, ".error-summary")
  element(:heading, ".heading-large")

  element(:first_name, "#contact_name_form_contact_first_name")
  element(:last_name, "#contact_name_form_contact_last_name")

  element(:submit_button, "input[type='submit']")

  def submit(args = {})
    first_name.set(args[:first_name]) if args.key?(:first_name)
    last_name.set(args[:last_name]) if args.key?(:last_name)
    submit_button.click
  end

end
