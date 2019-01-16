class FarmerPage < SitePrism::Page

  # Is the person carrying out the waste operation a farmer?
  element(:farmer_yes, "#on_a_farm_form_on_a_farm_true + label")
  element(:farmer_no, "#on_a_farm_form_on_a_farm_false + label")

  element(:submit_button, "input[type='submit']")

  def submit(args = {})
    if args[:farmer]
      farmer_yes.click
    else
      farmer_no.click
    end

    submit_button.click
  end

end
