# frozen_string_literal: true

class NamePage < SitePrism::Page

  # This is a generic page object file for applicant and contact names, as the page objects use the same structure.

  element(:error, ".error-summary")
  element(:heading, ".heading-large")

  element(:first_name, "input[id*='first_name']")
  element(:last_name, "input[id*='last_name']")

  element(:submit_button, "input[type='submit']")

  def submit(args = {})
    first_name.set(args[:first_name]) if args.key?(:first_name)
    last_name.set(args[:last_name]) if args.key?(:last_name)
    submit_button.click
  end

end
