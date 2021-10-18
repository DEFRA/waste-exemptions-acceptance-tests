# frozen_string_literal: true

require_relative "sections/admin_menu_section"

class ConfirmationLetterPage < BasePage

  element(:content, ".wel_letter")
  element(:heading_ref, "h1+ h2")

end
