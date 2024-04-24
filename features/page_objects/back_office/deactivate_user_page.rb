# frozen_string_literal: true

require_relative "sections/admin_menu_section"

class DeactivateUserPage < BasePage

  section(:admin_menu, AdminMenuSection, AdminMenuSection::SELECTOR)
  element(:submit_button, "button[type='submit']")

  def submit
    submit_button.click
  end

end
