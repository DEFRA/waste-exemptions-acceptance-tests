# frozen_string_literal: true

require_relative "sections/admin_menu_section"

class InvitationPage < SitePrism::Page

  section(:admin_menu, AdminMenuSection, AdminMenuSection::SELECTOR)

  element(:user_email, "#user_email")

  element(:sys, "#user_role_system+ label")
  element(:sa, "#user_role_super_agent+ label")
  element(:admin, "#user_role_admin_agent+ label")
  element(:data, "#user_role_data_agent+ label")

  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    user_email.set(args[:user_email]) if args.key?(:user_email)
    invite(args[:type])

    submit_button.click
  end

  private

  def invite(type)
    case type
    when :system_user
      sys.click
    when :super_agent
      sa.click
    when :admin_agent
      admin.click
    when :data_agent
      data.click
    end
  end

end
