# frozen_string_literal: true

require_relative "sections/admin_menu_section"

class ResendLetterPage < BasePage

  def resend_renewal_letter(registration_number)
    find(:css, "[href^='/resend-renewal-letter/#{registration_number}']")
  end

  def resend_confirmation_letter(registration_number)
    find(:css, "[href^='/resend-confirmation-letter/#{registration_number}']")
  end

end
