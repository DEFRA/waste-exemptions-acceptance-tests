# frozen_string_literal: true

class BasePage < SitePrism::Page

  element(:back_link, ".link-back")
  element(:heading, ".heading-large")
  element(:content, "#content")
  element(:error, ".error-summary")
  element(:submit_button, "button[type='submit']")
  element(:privacy_footer, "a[href='/pages/privacy']")
  element(:cookies_footer, "a[href='/pages/cookies']")
  element(:accessibility_footer, "a[href='/pages/accessibility']")

  def submit(_args = {})
    submit_button.click
  end

end
