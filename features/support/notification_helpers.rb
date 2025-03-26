# frozen_string_literal: true

require "faker"

def generate_example_email(first_name, last_name)
  first_name ||= Faker::Name.first_name
  last_name ||= Faker::Name.last_name

  "#{first_name.downcase}.#{last_name.downcase}#{rand(1..999)}@example.com".delete("'")
end

def email_exists?(expected_text, registration = nil)
  # expected_text is an array containing all the text you want to search for
  sleep(2)
  visit(Quke::Quke.config.custom["urls"]["notify_link"])
  @applicant_email = [registration[:applicant][:email]].first if @applicant_email.nil?
  expected_text_for_applicant = expected_text << @applicant_email
  return true if @world.journey.last_message_page.message_text?(expected_text_for_applicant)

  # removing applicant email from expected text
  expected_text.delete(@applicant_email)
  # If that doesn't work, try the contact email:
  @contact_email = [registration[:contact][:email]].first if @contact_email.nil?
  expected_text_for_contact = expected_text << @contact_email
  return true if @world.journey.last_message_page.message_text?(expected_text_for_contact)

  puts "Email not found"
  false
end

def letter_exists?(expected_text)
  visit(Quke::Quke.config.custom["urls"]["notify_link"])
  return true if @world.journey.last_message_page.message_text?(expected_text)

  puts "Letter not found"
  false
end
