# frozen_string_literal: true

require_relative "sections/admin_menu_section"

class DeregisterPage < BasePage

  section(:admin_menu_section, AdminMenuSection, AdminMenuSection::SELECTOR)

  element(:revoke_radio, "#deregister-exemptions-form-state-transition-revoke-field", visible: false)
  element(:cease_radio, "#deregister-exemptions-form-state-transition-cease-field", visible: false)
  element(:dereg_reason, "#deregister-exemptions-form-message-field")

  def submit(args = {})
    dereg_reason.set(args[:reason]) if args.key?(:reason)
    submit_button.click
  end

end
