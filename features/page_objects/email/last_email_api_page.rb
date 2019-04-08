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
    10.times do
      page.evaluate_script "window.location.reload()"
      email_text = email_content.text

      # Parse the whole JSON that's displayed. Retry on error message (if no emails generated yet):
      parsed_email_data = JSON.parse(email_text)
      next if parsed_email_data.key?("error")

      # If no error, use the JSON within the last instead, and check if 'to' address is correct:
      parsed_email_data = parsed_email_data["last_email"]
      next unless parsed_email_data["to"].include?(email_address)

      # Finally, find the text in the API JSON between the following two strings:
      # link below.\n\n
      # \n\n  This invitation
      # See https://stackoverflow.com/questions/4218986/ruby-using-regex-to-find-something-in-between-two-strings
      # Full stops need to be escaped. \s+ means 'any number of spaces'.
      return parsed_email_data["body"][/link below\.\n\n(.*?)\n\n\s+This invitation/, 1]
    end
  end

end
