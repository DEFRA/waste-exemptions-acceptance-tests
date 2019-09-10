# frozen_string_literal: true

class FarmerPage < SitePrism::Page

  element(:error, ".error-summary")

  # Is the person carrying out the waste operation a farmer?
  element(:farmer_yes, "#is_a_farmer_form_is_a_farmer_true + label")
  element(:farmer_no, "#is_a_farmer_form_is_a_farmer_false + label")

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
