# frozen_string_literal: true

require_relative "sections/admin_menu_section"

class PaymentDetailsPage < BasePage

  section(:admin_menu_section, AdminMenuSection, AdminMenuSection::SELECTOR)

  element(:record_payment, "[href*='/payments']")
  element(:amounts, ".govuk-table__cell govuk-!-text-align-right")

end
