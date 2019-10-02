# frozen_string_literal: true

class LocationPage < SitePrism::Page

  element(:error, ".error-summary")
  element(:heading, ".heading-large")

  element(:england, "#location_form_location_england + label")
  element(:wales, "#location_form_location_wales + label")
  element(:scotland, "#location_form_location_scotland + label")
  element(:northern_ireland, "#location_form_location_northern_ireland + label")

  element(:submit_button, "input[type='submit']")

  def submit(args = {})
    case args[:location]
    when :england
      england.select_option
    when :wales
      wales.select_option
    when :scotland
      scotland.select_option
    when :northern_ireland
      northern_ireland.select_option
    end

    submit_button.click
  end

end
