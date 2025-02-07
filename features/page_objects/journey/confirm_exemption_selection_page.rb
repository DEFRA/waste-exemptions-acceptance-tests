# frozen_string_literal: true

class ConfirmExemptionSelectionPage < BasePage

  element(:confirm, "input[value='true'] + label")
  element(:change, "input[value='false'] + label")

  def submit(args = {})
    case args[:choice]
    when :confirm
      confirm.click
    when :change
      change.click
    end

    submit_button.click
  end

end
