# frozen_string_literal: true

require "json"

class LastNotifyMsgPage < SitePrism::Page
  # Page which shows last email sent from Notify in JSON format

  element(:message_content, "pre")

  def get_accept_url(email_address)
    # Fail if email doesn't contain the correct email address and subject line text:
    if email_has_text?([email_address, "Create a Waste Exemptions back office account"]) == false
      puts("Couldn't find invite email")
      return "Email not found"
    end

    parsed_data = JSON.parse(message_content.text)
    # Find the text in the API JSON between the following two strings:
    #     link below.\n\n
    #     \n\n  This invitation
    # See https://stackoverflow.com/questions/4218986/ruby-using-regex-to-find-something-in-between-two-strings
    # Full stops need to be escaped. \s+ means 'any number of spaces'.
    parsed_data["last_notify_message"]["body"][/link below\.\n\n(.*?)\n\n\s+This invitation/, 1]
  end

  def get_renewal_url(email_address)
    # Uses the same logic as get_accept_url
    if email_has_text?([email_address, "renew online now"]) == false
      puts("Couldn't find renewal email")
      return "Email not found"
    end

    parsed_data = JSON.parse(message_content.text)
    # Find the string that matches:
    # https://, then any 15-24 characters, then /renew/, then any 24 characters
    parsed_data["last_notify_message"]["body"].match %r/https:\/\/.{15,24}\/renew\/.{24}/
  end

  def email_has_text?(expected_text)
    # Look for an email containing all the strings in the given array
    # and returns true if all the expected text is present.
    # Adapted from Waste Carriers.

    page_text = message_content.text
    return false if page_text.include?("Error")

    # Assume email contains all expected text unless proven otherwise:
    email_contains_all_text = true

    expected_text.each do |element|
      unless page_text.include?(element)
        email_contains_all_text = false
        break
      end
    end

    return true if email_contains_all_text

    puts "Couldn't find email containing all text: " + expected_text.to_s
    false
  end

end
