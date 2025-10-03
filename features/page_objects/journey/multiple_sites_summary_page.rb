# frozen_string_literal: true

class MultipleSitesSummaryPage < BasePage

  element(:add_site,
          "a[href$='/multisite-site-grid-reference']")
  element(:submit_button, "input[type='submit']")

  def submit(_args = {})
    submit_button.click
  end

end
