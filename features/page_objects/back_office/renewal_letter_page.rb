# frozen_string_literal: true

require_relative "sections/admin_menu_section"

class RenewalLetterPage < SitePrism::Page

  element(:content, "#letter_body")
  element(:heading, "h1")
  element(:heading_ref, ".medium")

end
