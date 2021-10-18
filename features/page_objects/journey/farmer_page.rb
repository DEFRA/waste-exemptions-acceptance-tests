# frozen_string_literal: true

class FarmerPage < BasePage

  # Is the person carrying out the waste operation a farmer?
  element(:farmer_yes, "input[value='true'] + label")
  element(:farmer_no, "input[value='false'] + label")

  def submit(args = {})
    if args[:farmer]
      farmer_yes.click
    else
      farmer_no.click
    end

    submit_button.click
  end

end
