class OnFarmPage < SitePrism::Page

  # Will this waste operation take place on a farm?
  element(:on_farm_yes, "#is_a_farm_form_is_a_farm_true", visible: false)
  element(:on_farm_no, "#is_a_farm_form_is_a_farm_false", visible: false)

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
