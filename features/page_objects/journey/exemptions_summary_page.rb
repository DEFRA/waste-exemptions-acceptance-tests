# frozen_string_literal: true

class ExemptionsSummaryPage < BasePage

  elements(:registration_charge, "#registration-charge-row .govuk-table__cell")
  element(:total_charge, "#total-charge, #total-charge-row .govuk-table__cell--numeric")
  elements(:exemptions, ".govuk-table__cell:nth-child(1)")
  elements(:charge_amounts, ".govuk-table__cell:nth-child(2)")
  elements(:charge_totals, ".govuk-table__cell:nth-child(3)")

  def submit(_args = {})
    submit_button.click
  end

end
