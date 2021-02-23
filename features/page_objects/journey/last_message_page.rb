# frozen_string_literal: true

require "json"

class LastMessagePage < SitePrism::Page
  # Page which shows last message sent in JSON format.
  # This file works for both the last Notify message and last email sent through Sendgrid - the elements are similar.
  # Sendgrid messages are on /email/last-email.
  # Notify messages are on /email/last-notify-message.

  element(:message_content, "pre")

  def get_accept_url(email_address)
    # This URL is generated through Sendgrid.
    # As there are two app servers, there is a 50% chance that the latest email
    # will show each time the page is refreshed.
    # The page will be loaded up to 10 times until the email shows
    # (a 1 in 1024 chance of the email not showing).
    # This is not necessary for Notify messages.
    10.times do
      page.evaluate_script "window.location.reload()"

      # Retry if parsed data doesn't contain the correct email address and subject line text:
      next if message_has_text?([email_address, "Create a Waste Exemptions back office account"]) == false

      parsed_data = JSON.parse(message_content.text)
      # Find the text in the API JSON between the following two strings:
      #     link below.\n\n
      #     \n\n  This invitation
      # See https://stackoverflow.com/questions/4218986/ruby-using-regex-to-find-something-in-between-two-strings
      # Full stops need to be escaped. \s+ means 'any number of spaces'.
      return parsed_data["last_email"]["body"][/link below\.\n\n(.*?)\n\n\s+This invitation/, 1]
    end
    puts("Couldn't find back office invite URL")
  end

  def get_renewal_url(email_address)
    # This email is generated through Notify.
    if message_has_text?([email_address, "renew online now"]) == false
      puts("Couldn't find renewal email")
      return "Email not found"
    end

    parsed_data = JSON.parse(message_content.text)
    # Find the string that matches:
    # https://, then any 15-24 characters, then /renew/, then any 24 characters
    parsed_data["last_notify_message"]["body"].match %r/https:\/\/.{15,24}\/renew\/.{24}/
  end

  def message_has_text?(expected_text)
    # Look for an email containing all the strings in the given array
    # and returns true if all the expected text is present.
    # Adapted from Waste Carriers.

    page_text = message_content.text
    return false if page_text.include?("Error")

    # Assume message contains all expected text unless proven otherwise:
    message_contains_all_text = true

    expected_text.each do |element|
      unless page_text.include?(element)
        message_contains_all_text = false
        break
      end
    end

    return true if message_contains_all_text

    puts "Couldn't find message containing all text: " + expected_text.to_s
    false
  end

end
