# frozen_string_literal: true

require "json"

class LastMessagePage < BasePage
  # Page which shows last message sent in JSON format.
  # Notify messages are on /email/last-notify-message.

  element(:message_content, "pre")

  def get_accept_url(email_address)
    if message_text?([email_address, "Create a Waste Exemptions back office account"]) == false
      puts("Couldn't find back office invite URL")
      return "Email not found"
    end

    parsed_data = JSON.parse(message_content.text)

    parsed_data["last_notify_message"]["body"].match %r/http(s?):\/\/.{30,50}\/accept.{38}/
  end

  def get_renewal_url(email_address)
    # This email is generated through Notify.
    if message_text?([email_address, "renew online now"]) == false
      puts("Couldn't find renewal email")
      return "Email not found"
    end

    parsed_data = JSON.parse(message_content.text)
    # Find the string that matches:
    # https://, then any 15-24 characters, then /renew/, then any 24 characters
    parsed_data["last_notify_message"]["body"].match %r/http(s?):\/\/.{14,28}\/renew\/.{24}/
  end

  def dereg_url
    # This email is generated through Notify.
    if message_text?(["Deregister your waste exemptions"]) == false
      puts("Couldn't find dereg email")
      return "Email not found"
    end

    parsed_data = JSON.parse(message_content.text)
    # Find the string that matches:
    # https://, then any 15-24 characters, then /renew/, then any 24 characters
    parsed_data["last_notify_message"]["body"].match %r/http(s?):\/\/.{14,28}\/edit_registration\/.{24}/
  end

  def get_unsubscribe_url(email_address)
    # This email is generated through Notify. It could be confirmation or renewal reminder email.
    if message_text?([email_address, "unsubscribe"]) == false
      puts("Couldn't find email")
      return "Email not found"
    end

    parsed_data = JSON.parse(message_content.text)
    # Find the string that matches:
    # https://, then any 15-24 characters, then /renew/, then any 24 characters
    parsed_data["last_notify_message"]["body"].match %r/http(s?):\/\/.{14,28}\/registrations\/unsubscribe\/.{24}/
  end

  def get_invite_url(email_address)
    # This email is generated through Notify.
    if message_text?([email_address, "Invitation to attend"]) == false
      puts("Couldn't find invite email")
      return "Email not found"
    end

    parsed_data = JSON.parse(message_content.text)
    # Find the string that matches:
    # https://, then any 15-24 characters, then /renew/, then any 24 characters
    # https://wex-dev.aws-int.defra.cloud/beta/84f59814-6013-421d-ac58-343ec85ebd82/start

    parsed_data["last_notify_message"]["body"].match %r/http(s?):\/\/.{14,40}\/beta\/.{42}/
  end

  def message_text?(expected_text)
    # Look for an message containing all the strings in the given array
    # and returns true if all the expected text is present.
    # Adapted from Waste Carriers.

    page_text = message_content.text
    puts page_text
    return false if page_text.include?("Error")

    # Assume message contains all expected text unless proven otherwise:
    contains_all_text = true
    i = 1
    expected_text.each do |element|
      puts element
      puts i
      unless page_text.include?(element)
        contains_all_text = false
        break
      end
      i += 1
    end

    return true if contains_all_text

    puts "Couldn't find message containing all text: #{expected_text}"
    false
  end

end
