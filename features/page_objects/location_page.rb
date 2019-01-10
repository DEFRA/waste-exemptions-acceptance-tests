class LocationPage < SitePrism::Page

  element(:england, "#location_form_location_england", visible: false)
  element(:wales, "#location_form_location_wales", visible: false)
  element(:scotland, "#location_form_location_scotland", visible: false)
  element(:northern_ireland, "#location_form_location_northern_ireland", visible: false)

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
