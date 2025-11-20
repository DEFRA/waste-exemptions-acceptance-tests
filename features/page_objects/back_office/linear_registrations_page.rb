# frozen_string_literal: true

require_relative "sections/admin_menu_section"

class LinearRegistrationsPage < BasePage

  section(:admin_menu_section, AdminMenuSection, AdminMenuSection::SELECTOR)

  sections :linear_registrations, "table tbody tr" do
    element(:status, "td:nth-child(1)")
    element(:registered_name, "td:nth-child(2)")
    element(:registration_number, "td:nth-child(3)")
    element(:contact, "td:nth-child(4)")
    element(:grid_ref, "td:nth-child(5)")
    element(:ea_area, "td:nth-child(6)")
    element(:view_registration, "td:nth-child(7)")
  end

  element(:last_page, "a[aria-label='Last page']")
  element(:first_view_registration_link, ".govuk-table__row:nth-child(1) .govuk-link")

  def linear_regs(registration_number)
    linear_registrations.find { |log| log.registration_number.text == registration_number }
  end
end
