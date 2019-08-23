# frozen_string_literal: true

class RenewSplashPage < SitePrism::Page

  element(:content, "#content")
  element(:heading, ".heading-large")
  element(:continue_button, ".button")

end
