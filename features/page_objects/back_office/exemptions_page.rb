# frozen_string_literal: true

require_relative "sections/admin_menu_section"

class ExemptionsPage < BasePage

  section(:admin_menu_section, AdminMenuSection, AdminMenuSection::SELECTOR)

  elements(:active_tags, ".status-tag-active")
  elements(:ceased_tags, ".status-tag-ceased")
  elements(:revoked_tags, ".status-tag-revoked")
  elements(:deregister_ex_links, ".deregister-exemption-button")
  elements(:deregistration_details, "[href*='/deregistrations']")

  sections :exemption_details, ".govuk-table__body .govuk-table__row" do
    element(:exemption, "td:nth-child(1)")
    element(:start_date, "td:nth-child(2)")
    element(:expiry_date, "td:nth-child(3)")
    element(:exemption_status, "td:nth-child(4)")
    element(:exemption_action, "td:nth-child(5)")
  end

end
