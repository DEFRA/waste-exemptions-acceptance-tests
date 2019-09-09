# frozen_string_literal: true

require "faker"

class PartnersPage < SitePrism::Page

  element(:error, ".error-summary")

  element(:first_name, "#main_people_form_first_name")
  element(:last_name, "#main_people_form_last_name")

  element(:add_person, "input[value='Add another person']")
  element(:submit_button, "input[value='Continue']")

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
