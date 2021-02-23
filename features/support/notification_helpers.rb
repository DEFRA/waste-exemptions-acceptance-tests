# frozen_string_literal: true

require "faker"

def generate_example_email(first_name, last_name)
  first_name ||= Faker::Name.first_name
  last_name ||= Faker::Name.last_name

  "#{first_name.downcase}.#{last_name.downcase}#{rand(1..999)}@example.com".delete("'")
end

def email_exists?(app, registration, expected_text)
  # app is :fo or :bo
  # registration is the full hash containing all registration details
  # expected_text is an array containing all the text you want to search for

  # Load the appropriate front or back office Notify page:
  if app == :bo
    visit(Quke::Quke.config.custom["urls"]["back_office_notify"])
  else
    visit(Quke::Quke.config.custom["urls"]["front_office_notify"])
  end

  # We don't know whether the applicant or contact email will be sent first, so try both.
  # Try the applicant email:
  expected_text_for_applicant = expected_text + [registration[:applicant][:email]]
  return true if @world.journey.last_message_page.message_has_text?(expected_text_for_applicant)

  # If that doesn't work, try the contact email:
  expected_text_for_contact = expected_text + [registration[:contact][:email]]
  return true if @world.journey.last_message_page.message_has_text?(expected_text_for_contact)

  puts "Email not found"
  false
end

def letter_exists?(registration, expected_text)
  visit(Quke::Quke.config.custom["urls"]["back_office_notify"])
  return true if @world.journey.last_message_page.message_has_text?(expected_text)

  puts "Letter not found"
  false
end
