# frozen_string_literal: true

require "faker"

class PartnersPage < BasePage

  element(:first_name, "#main-people-form-first-name-field")
  element(:last_name, "#main-people-form-last-name-field")

  element(:add_person, "input[value='Add another person']")
  element(:submit_button, ".govuk-button[type='submit']")

  def add_main_person(args = {})
    first_name.set(args[:first_name]) if args.key?(:first_name)
    last_name.set(args[:last_name]) if args.key?(:last_name)

    add_person.click
  end

  def submit(args = {})
    first_name.set(args[:first_name]) if args.key?(:first_name)
    last_name.set(args[:last_name]) if args.key?(:last_name)

    submit_button.click
  end

end
