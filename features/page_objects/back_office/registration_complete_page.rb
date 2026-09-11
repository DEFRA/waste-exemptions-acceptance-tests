# frozen_string_literal: true

require_relative "sections/admin_menu_section"

class RegistrationCompletePage < BasePage

  section(:admin_menu_section, AdminMenuSection, AdminMenuSection::SELECTOR)

  element(:home_link, "#navigation [href='/']")
  element(:registration_number, ".strong")

end
