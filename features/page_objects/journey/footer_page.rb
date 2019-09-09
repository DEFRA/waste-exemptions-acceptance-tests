# frozen_string_literal: true

class FooterPage < SitePrism::Page

  # This is a generic page object file for the footer links (privacy, cookies, accessibility)
  element(:heading, ".heading-large")
  element(:content, "#content")

end
