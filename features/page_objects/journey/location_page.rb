# frozen_string_literal: true

class LocationPage < BasePage

  element(:england, "#location-form-location-england-field + label")
  element(:wales, "#location-form-location-wales-field + label")
  element(:scotland, "#location-form-location-scotland-field + label")
  element(:northern_ireland, "#location-form-location-northern-ireland-field + label")

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
