# frozen_string_literal: true

class ExemptionsSummaryPage < BasePage

  element(:registration_charge, "#registration-charge-row .govuk-table__cell:nth-child(2)")
  elements(:total_charge, "#total-charge-row .govuk-table__cell")
  elements(:exemptions, ".govuk-table__cell:nth-child(1)")
  elements(:charge_amounts, ".govuk-table__cell:nth-child(2)")
  elements(:charge_totals, ".govuk-table__cell:nth-child(3)")

  def submit(_args = {})
    submit_button.click
  end

end
