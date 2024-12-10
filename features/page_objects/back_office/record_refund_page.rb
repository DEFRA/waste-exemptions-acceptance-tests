# frozen_string_literal: true

require_relative "sections/admin_menu_section"

class RecordRefundPage < BasePage

  section(:admin_menu_section, AdminMenuSection, AdminMenuSection::SELECTOR)

  elements(:record_refund, "[href*='/record-refund']")
  element(:amount, "#record-refund-form-amount-field")
  element(:reason, "#record-refund-form-comments-field")
  element(:submit_button, "input[type='submit']")

  def submit(args = {})
    amount.set(args[:amount]) if args.key?(:amount)
    reason.set(args[:reason]) if args.key?(:reason)
    submit_button.click
  end
end
