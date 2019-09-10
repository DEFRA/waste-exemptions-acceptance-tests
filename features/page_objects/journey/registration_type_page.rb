# frozen_string_literal: true

class RegistrationTypePage < SitePrism::Page

  element(:error, ".error-summary")

  element(:new_radio, "#start_form_start_option_new + label")
  element(:renew_radio, "#start_form_start_option_reregister + label")
  element(:change_registration, "#start_form_start_option_change + label")

  element(:submit_button, "input")

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
    change_registration.click
    submit_button.click
  end

end
