# frozen_string_literal: true

require_relative "sections/admin_menu_section"

class RecordReversalPage < BasePage

  section(:admin_menu_section, AdminMenuSection, AdminMenuSection::SELECTOR)

  element(:reverse_payment, "[href*='/record-reversal']")
  element(:reason, "#record-reversal-form-comments-field")
  element(:submit_button, "input[type='submit']")

  def submit(args = {})
    reason.set(args[:reason]) if args.key?(:reason)
    submit_button.click
  end

end
