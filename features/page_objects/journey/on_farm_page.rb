# frozen_string_literal: true

class OnFarmPage < BasePage

  # Will this waste operation take place on a farm?
  element(:on_farm_yes, "input[value='true'] + label")
  element(:on_farm_no, "input[value='false'] + label")

  def submit(args = {})
    if args[:on_farm]
      on_farm_yes.click
    else
      on_farm_no.click
    end

    submit_button.click
  end

end
