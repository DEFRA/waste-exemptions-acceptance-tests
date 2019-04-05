# frozen_string_literal: true

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
      next unless email_text.include?(email_address)

      # Find the text in the API JSON between the following two strings:
      # link below.\n\n
      # \n\n  This invitation
      # See https://stackoverflow.com/questions/4218986/ruby-using-regex-to-find-something-in-between-two-strings
      return email_text[/link below.\\n\\n(.*?)\\n\\n  This invitation/, 1]
    end
  end

end
