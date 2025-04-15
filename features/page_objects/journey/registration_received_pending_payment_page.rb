# frozen_string_literal: true

class RegistrationReceivedPendingPaymentPage < BasePage

  element(:registration_number, ".govuk-summary-list__row:nth-child(4) strong")
  element(:payment_amount, ".govuk-summary-list__row:nth-child(5) strong")

end
