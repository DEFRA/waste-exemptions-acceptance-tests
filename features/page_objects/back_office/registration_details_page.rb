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

  def resend_renewal_letter(registration_number)
    find(:css, "[href='/resend-renewal-letter/#{registration_number}']")
  end

  def resend_confirmation_letter(registration_number)
    find(:css, "[href='/resend-confirmation-letter/#{registration_number}']")
  end

  def resend_confirmation_email(registration_number)
    find(:css, "[href='/resend-confirmation-email/#{registration_number}']")
  end

  def communication_history(registration_number)
    find(:css, "[href='/registrations/#{registration_number}/communication_logs']")
  end

end
