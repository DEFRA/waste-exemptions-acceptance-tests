class FarmQuestionsPage < SitePrism::Page

  element(:off_farm, "input[id='event_off_farm']")
  element(:on_farm, "input[id='event_on_farm']")
  element(:not_farmer, "input[id='not_farmer']")
  element(:farmer, "input[id='farmer']")

  element(:submit_button, "input[value='Continue']")

  def submit(_args = {})
    off_farm.click
    farmer.click

    submit_button.click
  end

end
