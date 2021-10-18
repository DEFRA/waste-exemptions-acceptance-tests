# frozen_string_literal: true

class BasePage < SitePrism::Page

  element(:back_link, ".link-back")
  element(:heading, ".heading-large")
  element(:content, "#content")
  element(:error, ".error-summary")
  element(:submit_button, "button[type='submit']")

end
