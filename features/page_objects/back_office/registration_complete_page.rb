# frozen_string_literal: true

require_relative "sections/admin_menu_section.rb"

class RegistrationCompletePage < SitePrism::Page

  section(:admin_menu_section, AdminMenuSection, AdminMenuSection::SELECTOR)

  element(:registration_number, ".strong")

end
