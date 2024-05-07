# frozen_string_literal: true

require_relative "sections/admin_menu_section"

class DeregistrationDetailsPage < BasePage

  section(:admin_menu_section, AdminMenuSection, AdminMenuSection::SELECTOR)

  sections :exemption_details, "table tbody tr" do
    element(:exemption, "td:nth-child(1)")
    element(:deregistered_date, "td:nth-child(2)")
    element(:reason, "td:nth-child(3)")
    element(:status, "td:nth-child(4)")
    element(:user, "td:nth-child(5)")
  end

  def log_details(exemption)
    exemption_details.find { |log| log.exemption.text == exemption }
  end

end
