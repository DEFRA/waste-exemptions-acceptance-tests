# frozen_string_literal: true

require_relative "sections/admin_menu_section"

class AdPrivacyPolicyPage < SitePrism::Page

  element(:heading, ".heading-large")
  element(:content, ".column-two-thirds")
  element(:policy_text_link, "span", text: "Waste Exemptions privacy policy text")
  element(:dpo_details_link, "span", text: "Contact details for the Data Protection Officer")
  element(:ico_details_link, "span", text: "Contact details for the Information Commissioner's Office")
  element(:continue_button, ".button")

end
