# frozen_string_literal: true

require_relative "sections/admin_menu_section"

class RegistrationDetailsPage < BasePage

  section(:admin_menu_section, AdminMenuSection, AdminMenuSection::SELECTOR)

  element(:action_box, ".action-panel")
  element(:set_new_expiry_date, "[action$='/modify_expiry_date'] button")
  element(:deregister_reg_link, ".action-panel [action*='deregister'] button")
  elements(:deregister_ex_links, ".deregister-exemption-button")
  element(:deregister_invite_action, "[action^='/send-edit-invite'] button")
  elements(:deregistration_details, "[action^='/deregistrations'] button")
  element(:payment_details, "[action*='/payment_details'] button")
  element(:refresh_company_details, "[action^='/companies-house-details'] button")
  element(:company_name, ".govuk-summary-list__row:nth-child(4) .govuk-body:nth-child(2)")
  element(:change_history, "[action*='change_history'] button")
  element(:ea_area, ".govuk-summary-list .govuk-body:nth-child(12)")
  element(:sites, "[href*='/sites']")
  element(:resend_renewal_letter, "[action*='resend-renewal-letter'] button")
  element(:resend_confirmation_letter, "[action*='resend-confirmation-letter'] button")
  element(:resend_confirmation_email, "[action*='resend-confirmation-email'] button")
  element(:communication_history, "[action*='/communication_logs'] button")

  sections :exemption_details, "table tbody tr" do
    element(:exemption, "td:nth-child(1)")
    element(:registered_date, "td:nth-child(2)")
    element(:expiry_date, "td:nth-child(3)")
    element(:status, "td:nth-child(4)")
    element(:action, "td:nth-child(5)")
  end

end
