# frozen_string_literal: true

require_relative "sections/admin_menu_section"

class RecordPaymentPage < BasePage

  section(:admin_menu_section, AdminMenuSection, AdminMenuSection::SELECTOR)

  element(:missing_card, "#add_payment_form_payment_type_missing_card_payment", visible: false)
  element(:bank_transfer, "#add_payment_form_payment_type_bank_transfer", visible: false)
  element(:other, "#add_payment_form_payment_type_other_payment", visible: false)
  element(:amount, "#add-payment-form-payment-amount-field")
  element(:payment_day, "#add-payment-form-date-day-field")
  element(:payment_month, "#add-payment-form-date-month-field")
  element(:payment_year, "#add-payment-form-date-year-field")
  element(:payment_ref, "#add-payment-form-payment-reference-field")
  element(:payment_comment, "#add-payment-form-comments-field")

  # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity
  def submit(args = {})
    case args[:payment_type]
    when :bacs
      bank_transfer.click
    when :missing_card
      missing_card.click
    when :other
      other.click
    end
    amount.set(args[:amount]) if args.key?(:amount)
    payment_day.set(args[:payment_day]) if args.key?(:payment_day)
    payment_month.set(args[:payment_month]) if args.key?(:payment_month)
    payment_year.set(args[:payment_year]) if args.key?(:payment_year)
    payment_ref.set(args[:payment_ref]) if args.key?(:payment_ref)
    payment_comment.set(args[:payment_comment]) if args.key?(:payment_comment)
    submit_button.click
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity
  end
end
