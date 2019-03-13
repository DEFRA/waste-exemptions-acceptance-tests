# frozen_string_literal: true

class OnFarmPage < SitePrism::Page

  # Will this waste operation take place on a farm?
  element(:on_farm_yes, "#on_a_farm_form_on_a_farm_true + label")
  element(:on_farm_no, "#on_a_farm_form_on_a_farm_false + label")

  element(:submit_button, "input[type='submit']")

  def submit(args = {})
    if args[:on_farm]
      on_farm_yes.click
    else
      on_farm_no.click
    end

    submit_button.click
  end

end
