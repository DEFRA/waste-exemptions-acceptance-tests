# frozen_string_literal: true

class BasePage < SitePrism::Page

  element(:back_link, ".govuk-back-link")
  element(:heading, "h1")
  element(:content, "#content")
  element(:error, ".govuk-error-summary")
  element(:submit_button, "[type='submit']")

end
