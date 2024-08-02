# frozen_string_literal: true

class ExemptionsSummaryPage < BasePage

  element(:registration_charge, "#registration-charge")
  element(:total_charge, "#total-charge")
  elements(:exemptions, ".govuk-table__cell:nth-child(1)")
  elements(:bands, ".govuk-table__cell:nth-child(2)")
  elements(:charge_amounts, ".govuk-table__cell:nth-child(3)")
  elements(:charge_types, ".govuk-table__cell:nth-child(4)")

  def submit(_args = {})
    submit_button.click
  end

end
