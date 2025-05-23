# frozen_string_literal: true

require_relative "sections/admin_menu_section"

class ExtendExpiryDatePage < BasePage

  section(:admin_menu_section, AdminMenuSection, AdminMenuSection::SELECTOR)

  element(:day, "#modify-expiry-date-form-date-day-field")
  element(:month, "#modify-expiry-date-form-date-month-field")
  element(:year, "#modify-expiry-date-form-date-year-field")
  element(:reason_for_change, "#modify-expiry-date-form-reason-for-change-field")

  def submit(args = {})
    day.set(args[:day]) if args.key?(:day)
    month.set(args[:month]) if args.key?(:month)
    year.set(args[:year]) if args.key?(:year)
    reason_for_change.set(args[:reason]) if args.key?(:reason)

    submit_button.click
  end

end
