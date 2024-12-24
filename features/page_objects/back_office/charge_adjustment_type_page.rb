# frozen_string_literal: true

require_relative "sections/admin_menu_section"

class ChargeAdjustmentTypePage < BasePage

  section(:admin_menu_section, AdminMenuSection, AdminMenuSection::SELECTOR)

  element(:increase_charge, "#adjustment-type-form-adjustment-type-increase-field + label")
  element(:decrease_charge, "#adjustment-type-form-adjustment-type-decrease-field + label")

end
