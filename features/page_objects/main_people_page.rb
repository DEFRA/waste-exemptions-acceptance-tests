# frozen_string_literal: true

require "faker"

class MainPeoplePage < SitePrism::Page
  element(:first_name, "#main_people_form_first_name")
  element(:last_name, "#main_people_form_last_name")

  element(:add_person, "input[value='Add another person']")
  element(:submit_button, "input[value='Continue']")

  def add_main_person(args = {})
    person = args[:person]
    first_name.set(person[:first_name])
    last_name.set(person[:last_name])

    add_person.click
  end

  def submit(args = {})
    person = args[:person]
    first_name.set(person[:first_name])
    last_name.set(person[:last_name])

    submit_button.click
  end

  def main
    [
      { first_name: Faker::Name.first_name, last_name: Faker::Name.last_name },
      { first_name: Faker::Name.first_name, last_name: Faker::Name.last_name },
      { first_name: Faker::Name.first_name, last_name: Faker::Name.last_name },
      { first_name: Faker::Name.first_name, last_name: Faker::Name.last_name }
    ]
  end

end
