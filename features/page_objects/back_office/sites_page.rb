# frozen_string_literal: true

require_relative "sections/admin_menu_section"

class SitesPage < BasePage

  section(:admin_menu_section, AdminMenuSection, AdminMenuSection::SELECTOR)

  elements(:waste_sites, ".govuk-table__body .govuk-table__row")
  elements(:active_tags, ".status-tag-active")
  element(:next_page, "a[aria-label='Next page']")

  sections :sites, "table tbody tr" do
    element(:registration, "td:nth-child(1)")
    element(:location, "td:nth-child(2)")
    element(:site_details, "td:nth-child(3)")
    element(:ea_area, "td:nth-child(4)")
    element(:site_status, "td:nth-child(5)")
    element(:deregistered_exemptions, "td:nth-child(6)")
    element(:actions, "td:nth-child(7)")
    element(:exemptions_link, ".govuk-link:nth-child(1)")
    element(:deregister_link, ".govuk-link:nth-child(2)")
  end

end
