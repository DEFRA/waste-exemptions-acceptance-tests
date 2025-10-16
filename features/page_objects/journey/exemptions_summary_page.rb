# frozen_string_literal: true

class ExemptionsSummaryPage < BasePage

  element(:registration_charge, "#registration-charge, #registration-charge-row .govuk-table__cell--numeric")
  element(:total_charge, "#total-charge, #total-charge-row .govuk-table__cell--numeric")
  elements(:exemptions, ".govuk-table__cell:nth-child(1)")
  elements(:charge_amounts, ".govuk-table__cell:nth-child(3)")

  def submit(_args = {})
    submit_button.click
  end

end
