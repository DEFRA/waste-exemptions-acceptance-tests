# frozen_string_literal: true

class OnFarmPage < BasePage

  # Will this waste operation take place on a farm?
  element(:on_farm_yes, "#on-a-farm-form-on-a-farm-true-field + label")
  element(:on_farm_no, "#on-a-farm-form-on-a-farm-field + label")

  def submit(args = {})
    if args[:on_farm]
      on_farm_yes.click
    else
      on_farm_no.click
    end

    submit_button.click
  end

end
