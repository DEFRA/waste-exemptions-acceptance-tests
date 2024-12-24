# frozen_string_literal: true

require_relative "sections/admin_menu_section"

class ChargeAdjustmentPage < BasePage

  section(:admin_menu_section, AdminMenuSection, AdminMenuSection::SELECTOR)

  element(:amount, "#charge-adjustment-form-amount-field")
  element(:reason, "#charge-adjustment-form-reason-field")

  def submit(args = {})
    amount.set(args[:amount]) if args.key?(:amount)
    reason.set(args[:reason]) if args.key?(:reason)
    submit_button.click
  end

end
