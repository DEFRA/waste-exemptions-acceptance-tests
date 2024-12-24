# frozen_string_literal: true

require_relative "sections/admin_menu_section"

class PaymentDetailsPage < BasePage

  section(:admin_menu_section, AdminMenuSection, AdminMenuSection::SELECTOR)

  element(:record_payment, "[href*='/payments']")
  element(:balance, "#balance")
  element(:record_refund, "[href*='/record-refund']")
  element(:reverse_payment, "[href*='/record-reversal']")
  element(:adjust_charge, "[href*='/adjustment-type']")

end
