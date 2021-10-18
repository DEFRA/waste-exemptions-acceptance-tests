# frozen_string_literal: true

require_relative "sections/admin_menu_section"

class RegistrationCompletePage < BasePage

  section(:admin_menu_section, AdminMenuSection, AdminMenuSection::SELECTOR)

  element(:home_link, "#proposition-name")
  element(:registration_number, ".strong")

end
