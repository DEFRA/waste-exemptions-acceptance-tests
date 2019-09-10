# frozen_string_literal: true

class StandardPage < SitePrism::Page

  # This is a generic page object file used for simple, standard pages:
  #  - footer links (privacy, cookies, accessibility)
  #  - option to change details
  #  - register outside England pages

  element(:back_link, ".link-back")
  element(:heading, ".heading-large")
  element(:content, "#content")

end
