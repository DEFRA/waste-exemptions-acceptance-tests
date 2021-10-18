# frozen_string_literal: true

class NamePage < BasePage

  # This is a generic page object file for applicant and contact names, as the page objects use the same structure.

  element(:first_name, "input[id*='first-name'], input[id*='first_name']")
  element(:last_name, "input[id*='last-name'], input[id*='last_name']")

  def submit(args = {})
    first_name.set(args[:first_name]) if args.key?(:first_name)
    last_name.set(args[:last_name]) if args.key?(:last_name)
    submit_button.click
  end

end
