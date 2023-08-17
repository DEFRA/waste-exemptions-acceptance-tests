# frozen_string_literal: true

class ConfirmEditExemptionsPage < BasePage

  element(:accept, "input[value='edit_exemptions_declaration_form']+ .govuk-radios__label")
  element(:reject, "input[value='edit_exemptions_form']+ .govuk-radios__label")

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
