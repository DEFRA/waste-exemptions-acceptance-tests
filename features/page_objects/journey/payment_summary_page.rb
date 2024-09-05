# frozen_string_literal: true

class PaymentSummaryPage < BasePage

  element(:card_payment, "#payment-summary-form-temp-payment-method-card-field", visible: false)
  element(:bank_transfer, "#payment-summary-form-temp-payment-method-bank-transfer-field", visible: false)

  def submit(args = {})
    case args[:payment_type]
    when :card
      card_payment.click
    when :bank
      bank_transfer.click
    end

    submit_button.click
  end

end
