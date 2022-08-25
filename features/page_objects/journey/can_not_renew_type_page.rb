# frozen_string_literal: true

class CanNotRenewTypePage < BasePage

  element(:new_registration_option, "a[href='/start']")

  def submit
    new_registration_option.click
  end

end
