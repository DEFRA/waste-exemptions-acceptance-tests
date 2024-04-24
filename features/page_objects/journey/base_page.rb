# frozen_string_literal: true

class BasePage < SitePrism::Page

  element(:back_link, ".govuk-back-link")
  element(:heading, "h1")
  element(:content, "#content")
  element(:error, ".govuk-error-summary")
  element(:submit_button, "button[type='submit']")
  element(:accept_analytics_cookies, "form[action='/cookies/accept_analytics']")
  element(:reject_analytics_cookies, "form[action='/cookies/reject_analytics']")
  element(:hide_cookie_banner, "form[action='/cookies/hide_this_message']")

  def submit(_args = {})
    submit_button.click
  end

  def accept_cookies
    return unless has_accept_analytics_cookies?

    accept_analytics_cookies.click
    hide_cookie_banner.click
  end

end
