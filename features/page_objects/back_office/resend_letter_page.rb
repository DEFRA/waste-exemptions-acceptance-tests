# frozen_string_literal: true

require_relative "sections/admin_menu_section"

class ResendLetterPage < BasePage

  element(:resend_renewal_letter, "form[action*='resend-renewal-letter'] button")
  element(:resend_confirmation_letter, "form[action*='resend-confirmation-letter'] button")

end
