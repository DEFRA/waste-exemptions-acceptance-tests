# frozen_string_literal: true

class RegistrationTypePage < BasePage

  element(:new_radio, "input[value='new']+ .govuk-radios__label")
  element(:renew_radio, "input[value='reregister']+ .govuk-radios__label")
  element(:edit_registration, "input[value='edit']+ .govuk-radios__label")

  element(:submit_button, "button[type='submit']")

  def submit(args = {})
    # As long as the arg passed in matches the name of an element we can simply
    # invoke the element using ruby's send() method. In this way we can avoid
    # overly long case/switch statements that check the value of the arg to
    # determine which element to select
    send(args[:start_option]).select_option

    submit_button.click
  end

  def submit_new
    new_radio.click
    submit_button.click
  end

  def submit_reregister
    renew_radio.click
    submit_button.click
  end

  def submit_change
    edit_registration.click
    submit_button.click
  end

end
