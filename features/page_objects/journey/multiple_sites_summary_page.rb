# frozen_string_literal: true

class MultipleSitesSummaryPage < BasePage

  element(:add_site, "a[href$='/site-grid-reference']")
  elements(:delete_site, "[action*='sites/remove_site/'] .button-link")
  element(:submit_button, "input[type='submit']")

  def submit(_args = {})
    submit_button.click
  end

end
