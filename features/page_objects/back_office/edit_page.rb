# frozen_string_literal: true

require_relative "sections/admin_menu_section"

class EditPage < BasePage

  section(:admin_menu_section, AdminMenuSection, AdminMenuSection::SELECTOR)

  element(:change_applicant_link, "a[href*='/edit/applicant_name']")
  element(:change_operator_link, "a[href*='/edit/operator_name']")
  element(:change_contact_email_link, "a[href*='/edit/contact_email']")
  element(:change_applicant_phone, "a[href*='/edit/applicant_phone']")
  element(:change_site_location, "a[href*='/edit/site_grid_reference']")
  element(:change_contact_address, "a[href*='/edit/contact_postcode']")
  element(:cancel_link, "a[href*='/cancel']")

end
