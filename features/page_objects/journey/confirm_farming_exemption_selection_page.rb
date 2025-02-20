# frozen_string_literal: true

class ConfirmFarmingExemptionSelectionPage < BasePage

  element(:confirm, "input[value='false'] + label")
  element(:change, "input[value='true'] + label")

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
