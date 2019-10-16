# frozen_string_literal: true

class RenewSplashPage < SitePrism::Page

  element(:back_link, ".link-back")
  element(:heading, ".heading-large")

  element(:content, "#content")
  element(:continue_button, ".button")

end
