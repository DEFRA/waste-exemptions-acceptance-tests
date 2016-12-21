class RegistrationTypePage < SitePrism::Page

  element(:new_registration, "input[id='yes_option1']")
  element(:re_register, "input[id='yes_option2']")
  element(:renew_registration, "input[id='yes_option3']")

  element(:submit_button, "input[name='commit']")

  def submit_new
    new_registration.click
    submit_button.click
  end

  def submit_reregister
    re_register.click
    submit_button.click
  end

  def submit_renew
    renew_registration.click
    submit_button.click
  end

end
