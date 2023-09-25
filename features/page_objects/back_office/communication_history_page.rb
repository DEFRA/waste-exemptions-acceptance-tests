# frozen_string_literal: true

require_relative "sections/admin_menu_section"

class CommunicationHistoryPage < BasePage

  section(:admin_menu_section, AdminMenuSection, AdminMenuSection::SELECTOR)

  element(:heading, "h1.govuk-heading-l")

  sections :communication_logs, "table tbody tr" do
    element(:template_name, "td:nth-child(1)")
    element(:template_id, "td:nth-child(2)")
    element(:type, "td:nth-child(3)")
    element(:sent_to, "td:nth-child(4)")
    element(:sent_on, "td:nth-child(5)")
  end

  def log_details(sent_to)
    communication_logs.find { |log| log.sent_to.text == sent_to }
  end
end
