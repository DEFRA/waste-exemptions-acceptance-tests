# frozen_string_literal: true

require_relative "sections/admin_menu_section.rb"

class RegistrationDetailsPage < SitePrism::Page

  section(:admin_menu_section, AdminMenuSection, AdminMenuSection::SELECTOR)

  element(:heading, ".heading-large")
  element(:deregister_reg_link, ".separated a")
  elements(:active_tags, ".status-tag-active")
  elements(:ceased_tags, ".status-tag-ceased")
  elements(:revoked_tags, ".status-tag-revoked")
  elements(:deregister_ex_links, ".deregister-exemption-button")

end
