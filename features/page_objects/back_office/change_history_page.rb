# frozen_string_literal: true

require_relative "sections/admin_menu_section"

class ChangeHistoryPage < BasePage

  section(:admin_menu_section, AdminMenuSection, AdminMenuSection::SELECTOR)

  sections :edit_history_logs, "table tbody tr" do
    element(:date, "td:nth-child(1)")
    element(:updated_detail, "td:nth-child(2)")
    element(:changed_from, "td:nth-child(3)")
    element(:change_reason, "td:nth-child(4)")
    element(:changed_by, "td:nth-child(5)")
  end

  def change_reason(reason)
    edit_history_logs.find { |log| log.change_reason.text == reason }
  end
end
