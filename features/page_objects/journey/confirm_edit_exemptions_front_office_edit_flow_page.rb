# frozen_string_literal: true

class ConfirmEditExemptionsFrontOfficeEditFlowPage < BasePage

  element(:accept,
          "#confirm-edit-exemptions-form-temp-confirm-exemption-edits-true-field+ .govuk-radios__label")
  element(:reject,
          "#confirm-edit-exemptions-form-temp-confirm-exemption-edits-field+ .govuk-radios__label")

  def submit(args = {})
    case args[:deregister]
    when :accept
      accept.click
    when :reject
      reject.click
    end

    submit_button.click
  end

end
