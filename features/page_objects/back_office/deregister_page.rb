# frozen_string_literal: true

require_relative "sections/admin_menu_section"

class DeregisterPage < SitePrism::Page

  section(:admin_menu_section, AdminMenuSection, AdminMenuSection::SELECTOR)

  element(:heading, ".heading-large")
  element(:revoke_radio, "#deregister_exemptions_form_state_transition_revoke", visible: false)
  element(:cease_radio, "#deregister_exemptions_form_state_transition_cease", visible: false)
  element(:dereg_reason, "#deregister_exemptions_form_message")
  element(:dereg_button, ".button")

  def submit(args = {})
    dereg_reason.set(args[:reason]) if args.key?(:reason)
    dereg_button.click
  end

end
