# frozen_string_literal: true

require_relative "sections/admin_menu_section.rb"

class ConfirmationLetterPage < SitePrism::Page

  element(:content, ".wel_letter")
  element(:heading, "h1")
  element(:heading_ref, "h1+ h2")

end
