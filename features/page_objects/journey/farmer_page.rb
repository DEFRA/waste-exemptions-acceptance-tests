# frozen_string_literal: true

class FarmerPage < BasePage

  # Is the person carrying out the waste operation a farmer?
  element(:farmer_yes, "#is-a-farmer-form-is-a-farmer-true-field + label")
  element(:farmer_no, "#is-a-farmer-form-is-a-farmer-field + label")

  def submit(args = {})
    if args[:farmer]
      farmer_yes.click
    else
      farmer_no.click
    end

    submit_button.click
  end

end
