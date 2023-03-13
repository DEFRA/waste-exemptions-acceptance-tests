# frozen_string_literal: true

class ConfirmEditExemptionsPage < BasePage

  element(:accept,
          "#confirm-edit-exemptions-form-workflow-state-edit-exemptions-declaration-form-field+ .govuk-radios__label")
  element(:reject, "#confirm-edit-exemptions-form-workflow-state-edit-exemptions-form-field+ .govuk-radios__label")

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
