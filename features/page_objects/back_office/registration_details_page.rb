# frozen_string_literal: true

require_relative "sections/admin_menu_section"

class RegistrationDetailsPage < BasePage

  section(:admin_menu_section, AdminMenuSection, AdminMenuSection::SELECTOR)

  element(:action_box, ".action-panel")
  element(:deregister_reg_link, ".action-panel a[href*='deregister']")
  elements(:active_tags, ".status-tag-active")
  elements(:ceased_tags, ".status-tag-ceased")
  elements(:revoked_tags, ".status-tag-revoked")
  elements(:deregister_ex_links, ".deregister-exemption-button")
  element(:reporting_info_link, ".govuk-details__summary-text")
  element(:deregister_invite_action, "a[href^='/send-edit-invite']")
  elements(:deregistation_details, "[href^='/deregistrations']")

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
