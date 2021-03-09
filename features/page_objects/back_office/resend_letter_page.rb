# frozen_string_literal: true

require_relative "sections/admin_menu_section"

class ResendLetterPage < SitePrism::Page

  element(:heading, "h1")

  def resend_renewal_letter(registration_number)
    find(:css, "[href='/resend-renewal-letter/#{registration_number}']")
  end

end
