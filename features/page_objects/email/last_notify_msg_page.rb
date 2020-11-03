# frozen_string_literal: true

require "json"

class LastNotifyMsgPage < SitePrism::Page
  # Page which shows last email sent from Notify in JSON format

  element(:message_content, "pre")

  def get_accept_url(email_address)
    parsed_data = JSON.parse(message_content.text)

    # Fail if parsed data doesn't contain the correct email address and subject line text:
    if expected_email?(parsed_data, email_address, "Create a Waste Exemptions back office account") == false
      puts("Couldn't find invite email")
      return "Email not found"
    end

    # Find the text in the API JSON between the following two strings:
    #     link below.\n\n
    #     \n\n  This invitation
    # See https://stackoverflow.com/questions/4218986/ruby-using-regex-to-find-something-in-between-two-strings
    # Full stops need to be escaped. \s+ means 'any number of spaces'.
    parsed_data["last_notify_message"]["body"][/link below\.\n\n(.*?)\n\n\s+This invitation/, 1]
  end

  def get_renewal_url(email_address)
    # Uses the same logic as get_accept_url
    parsed_data = JSON.parse(message_content.text)
    if expected_email?(parsed_data, email_address, "renew online now") == false
      puts("Couldn't find renewal email")
      return "Email not found"
    end

    # Find the string that matches:
    # https://, then any 15-24 characters, then /renew/, then any 24 characters
    parsed_data["last_notify_message"]["body"].match %r/https:\/\/.{15,24}\/renew\/.{24}/
  end

  def get_confirmation_email(email_address, registration_no)
    page.evaluate_script "window.location.reload()"
    parsed_data = JSON.parse(message_content.text)
    # Fail if the correct email address and waste exemption number aren't shown:
    if expected_email?(parsed_data, email_address, registration_no) == false
      puts("Couldn't find email and WEX number")
      return("Email not found")
    end
    parsed_data["last_notify_message"].to_s
  end

  def expected_email?(parsed_data, email_address, subject_text)
    # Check the parsed data to see whether it contains the expected email address and subject line text.
    return false if parsed_data.key?("error")
    return false unless parsed_data["last_notify_message"]["to"].include?(email_address)
    return false unless parsed_data["last_notify_message"]["subject"].include?(subject_text)

    true
  end

end
