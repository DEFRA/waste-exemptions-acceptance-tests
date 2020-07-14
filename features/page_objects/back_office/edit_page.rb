# frozen_string_literal: true

require_relative "sections/admin_menu_section"

class EditPage < SitePrism::Page

  section(:admin_menu_section, AdminMenuSection, AdminMenuSection::SELECTOR)

  element(:content, "#content")
  element(:heading, ".heading-large")
  element(:change_applicant_link, "a[href*='/edit/applicant_name']")
  element(:change_operator_link, "a[href*='/edit/operator_name']")
  element(:change_contact_email_link, "a[href*='/edit/contact_email']")

  element(:continue_button, ".button")
  element(:cancel_link, ".edit_linker a")

end
