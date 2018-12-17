require_relative "sections/admin_nav_bar_section"

class ConfirmationLetterBulkExportsPage < SitePrism::Page

  element(:export_alert, "div.alert-success[role='alert']")
  element(:from_day, "#confirmation_letter_bulk_export_from_date_3i")
  element(:from_month, "#confirmation_letter_bulk_export_from_date_2i")
  element(:from_year, "#confirmation_letter_bulk_export_from_date_1i")

  element(:to_day, "#confirmation_letter_bulk_export_to_date_3i")
  element(:to_month, "#confirmation_letter_bulk_export_to_date_2i")
  element(:to_year, "#confirmation_letter_bulk_export_to_date_1i")

  element(:request_export, "input[name='commit']")

  element(:refresh, ".btn-sm")

  element(:latest_export_file, ".confirmation_letter_bulk_export:first-of-type a")

  element(:latest_export_status, ".confirmation_letter_bulk_export:first-of-type span")

  section(:nav_bar, AdminNavBarSection, AdminNavBarSection::SELECTOR)

  def submit(args = {})
    from_day.select(args[:from_day]) if args.key?(:from_day)
    from_month.select(args[:from_month]) if args.key?(:from_month)
    from_year.select(args[:from_year]) if args.key?(:from_year)
    # defaults to current day's date if left blank
    to_day.select(args[:to_day]) if args.key?(:to_day)
    to_month.select(args[:to_month]) if args.key?(:to_month)
    to_year.select(args[:to_year]) if args.key?(:to_year)
    request_export.click
  end

end
