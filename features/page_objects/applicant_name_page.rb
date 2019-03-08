# frozen_string_literal: true

require "faker"

class ApplicantNamePage < SitePrism::Page

  element(:first_name, "#applicant_name_form_first_name")
  element(:last_name, "#applicant_name_form_last_name")

  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    person = args[:person]
    first_name.set(person[:first_name])
    last_name.set(person[:last_name])
    submit_button.click
  end

  def applicant
    [
      { first_name: Faker::Name.first_name, last_name: Faker::Name.last_name },
      { first_name: Faker::Name.first_name, last_name: Faker::Name.last_name },
      { first_name: Faker::Name.first_name, last_name: Faker::Name.last_name },
      { first_name: Faker::Name.first_name, last_name: Faker::Name.last_name }
    ]
  end

end
