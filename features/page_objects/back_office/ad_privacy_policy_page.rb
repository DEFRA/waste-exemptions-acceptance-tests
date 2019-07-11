# frozen_string_literal: true

require_relative "sections/admin_menu_section.rb"

class AdPrivacyPolicyPage < SitePrism::Page

  element(:heading, ".heading-large")
  element(:content, ".column-two-thirds")
  element(:policy_text_link, "span:contains('Waste Exemptions privacy policy text')")
  element(:continue_button, ".button")

end
