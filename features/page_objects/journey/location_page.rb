# frozen_string_literal: true

class LocationPage < BasePage

  element(:england, "input[value='england'] + label")
  element(:wales, "input[value='wales'] + label")
  element(:scotland, "input[value='scotland'] + label")
  element(:northern_ireland, "input[value='northern_ireland'] + label")

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
