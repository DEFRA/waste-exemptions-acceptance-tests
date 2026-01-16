# frozen_string_literal: true

require_relative "sections/admin_menu_section"

class RegistrationDetailsPage < BasePage

  section(:admin_menu_section, AdminMenuSection, AdminMenuSection::SELECTOR)

  element(:action_box, ".action-panel")
  element(:set_new_expiry_date, "a[href$='/modify_expiry_date']")
  element(:deregister_reg_link, ".action-panel a[href*='deregister']")
  elements(:deregister_ex_links, ".deregister-exemption-button")
  element(:deregister_invite_action, "a[href^='/send-edit-invite']")
  elements(:deregistration_details, "[href^='/deregistrations']")
  element(:payment_details, "[href*='/payment_details']")
  element(:refresh_company_details, "[action^='/companies-house-details'] button")
  element(:company_name, ".govuk-summary-list__row:nth-child(4) .govuk-body:nth-child(2)")
  element(:change_history, "a[href*='change_history']")
  element(:ea_area, ".govuk-summary-list .govuk-body:nth-child(12)")
  element(:sites, "[href*='/sites']")
  element(:resend_renewal_letter, "a[href*='resend-renewal-letter']")
  element(:resend_confirmation_letter, "a[href*='resend-confirmation-letter']")
  element(:resend_confirmation_email, "a[href*='resend-confirmation-email']")
  element(:communication_history, "a[href*='/communication_logs']")

  sections :exemption_details, "table tbody tr" do
    element(:exemption, "td:nth-child(1)")
    element(:registered_date, "td:nth-child(2)")
    element(:expiry_date, "td:nth-child(3)")
    element(:status, "td:nth-child(4)")
    element(:action, "td:nth-child(5)")
  end

end
