class FarmQuestionsPage < SitePrism::Page

  # Will this waste operation take place on a farm?
  element(:on_farm_yes, "#event_on_farm")
  element(:on_farm_no, "#event_off_farm")

  # Is the person carrying out the waste operation a farmer?
  element(:farmer_yes, "#farmer")
  element(:farmer_no, "#not_farmer")

  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    if args[:on_farm]
      on_farm_yes.click
    else
      on_farm_no.click
    end

    if args[:farmer]
      farmer_yes.click
    else
      farmer_no.click
    end

    submit_button.click
  end

end
