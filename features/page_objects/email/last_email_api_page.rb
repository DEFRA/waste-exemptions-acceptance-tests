# frozen_string_literal: true

require "json"

class LastEmailApiPage < SitePrism::Page
  # Page which shows last email sent to any address from the environment.
  # As there are two app servers, there is a 50% chance that the latest email
  # will show each time the page is refreshed.
  # The page will be loaded up to 10 times until the email shows
  # (a 1 in 1024 chance of the email not showing).

  element(:email_content, "pre")

  def get_accept_url(email_address)
    2.times do
      page.evaluate_script "window.location.reload()"
      parsed_data = JSON.parse(email_content.text)

      # Retry if parsed data doesn't contain the correct email address and subject line text:
      next if expected_email?(parsed_data, email_address, "Create a Waste Exemptions back office account") == false

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
    # Uses the same logic as get_accept_url
    2.times do
      page.evaluate_script "window.location.reload()"
      parsed_data = JSON.parse(email_content.text)
      next if expected_email?(parsed_data, email_address, "renew online now") == false

      # Find the string that matches:
      # https://, then any 15-24 characters, then /renew/, then any 24 characters
      return parsed_data["last_email"]["body"].match %r/https:\/\/.{15,24}\/renew\/.{24}/
    end
    puts("Couldn't find renewal URL")
  end

  def get_confirmation_email(email_address, registration_no)
    2.times do
      page.evaluate_script "window.location.reload()"
      parsed_data = JSON.parse(email_content.text)
      # Retry if the correct email address and waste exemption number aren't shown:
      next if expected_email?(parsed_data, email_address, registration_no) == false

      return parsed_data["last_email"].to_s
    end

    # Return "nope" if the contact/applicant email couldn't be found.
    "nope"
  end

  def expected_email?(parsed_data, email_address, subject_text)
    # Check the parsed data to see whether it contains the expected email address and subject line text.
    return false if parsed_data.key?("error")
    return false unless parsed_data["last_email"]["to"].include?(email_address)
    return false unless parsed_data["last_email"]["subject"].include?(subject_text)

    true
  end

end
