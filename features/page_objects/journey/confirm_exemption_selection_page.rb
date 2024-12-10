# frozen_string_literal: true

class ConfirmExemptionSelectionPage < BasePage

  element(:confirm, "input[value='true'] + label")
  element(:change, "input[value='false'] + label")

  def submit(args = {})
    if args[:choice]
      confirm.click
    else
      change.click
    end

    submit_button.click
  end

end
