# frozen_string_literal: true

require_relative "sections/admin_menu_section"

class CommunicationHistoryPage < BasePage

  section(:admin_menu_section, AdminMenuSection, AdminMenuSection::SELECTOR)

  element(:heading, "h1.govuk-heading-l")

  sections :communication_logs, "table tbody tr" do
    element(:template_title, "td:nth-child(1)")
    element(:type, "td:nth-child(2)")
    element(:sent_on, "td:nth-child(3)")
    element(:delivery_status, "td:nth-child(4)")
  end

  def log_details(template_title)
    5.times do
      unless communication_logs.any? { |log| log.template_title.text == template_title }
        sleep 1
        page.evaluate_script "window.location.reload()"
      end
    end
    raise "No communication log found with template title: #{template_title}" unless communication_logs.any? do |log|
      log.template_title.text == template_title
    end

    communication_logs.find { |log| log.template_title.text == template_title }
  end
end
