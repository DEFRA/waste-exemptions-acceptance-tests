# frozen_string_literal: true

require_relative "sections/admin_menu_section"

class EditReasonPage < BasePage

  section(:admin_menu_section, AdminMenuSection, AdminMenuSection::SELECTOR)

  element(:reason_for_change, "#reason-for-change-form-reason-for-change-field")

  def submit(args = {})
    reason_for_change.set(args[:reason]) if args.key?(:reason)

    submit_button.click
  end

end
