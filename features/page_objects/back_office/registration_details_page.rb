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
  element(:refresh_company_details, "a[href^='/companies-house-details']")
  element(:company_name, ".govuk-summary-list__row:nth-child(4) .govuk-body:nth-child(2)")
  element(:change_history, "a[href*='change_history']")
  element(:ea_area, ".govuk-summary-list .govuk-body:nth-child(12)")
  element(:sites, "[href*='/sites']")

  sections :exemption_details, "table tbody tr" do
    element(:exemption, "td:nth-child(1)")
    element(:registered_date, "td:nth-child(2)")
    element(:expiry_date, "td:nth-child(3)")
    element(:status, "td:nth-child(4)")
    element(:action, "td:nth-child(5)")
  end

  def resend_renewal_letter(registration_number)
    find(:css, "[href^='/resend-renewal-letter/#{registration_number}']")
  end

  def resend_confirmation_letter(registration_number)
    find(:css, "[href^='/resend-confirmation-letter/#{registration_number}']")
  end

  def resend_confirmation_email(registration_number)
    find(:css, "[href^='/resend-confirmation-email/#{registration_number}']")
  end

  def communication_history(registration_number)
    find(:css, "[href^='/registrations/#{registration_number}/communication_logs']")
  end

  def resend_renewal_inviation(registration_number)
    find(:css, "[href^='/resend-renewal-email/#{registration_number}']")
  end

end
