class RegistrationTypePage < SitePrism::Page

  element(:new_registration, "#start_form_start_new", visible: false)
  element(:re_register, "#start_form_start_reregister", visible: false)
  element(:change_registration, "#start_form_start_change", visible: false)

  element(:submit_button, "input[type='submit']")

  def submit_new
    new_registration.click
    submit_button.click
  end

  def submit_reregister
    re_register.click
    submit_button.click
  end

  def submit_change
    change_registration.click
    submit_button.click
  end

end
