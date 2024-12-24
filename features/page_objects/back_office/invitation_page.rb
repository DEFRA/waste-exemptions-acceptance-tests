# frozen_string_literal: true

require_relative "sections/admin_menu_section"

class InvitationPage < BasePage

  section(:admin_menu, AdminMenuSection, AdminMenuSection::SELECTOR)

  element(:user_email, "#user_email")

  element(:customer_service_advisor, "#user_role_customer_service_adviser+ label")
  element(:data_viewer, "#user_role_data_viewer+ label")
  element(:finance_user, "#user_role_finance_user+ label")
  element(:developer, "#user_role_developer+ label")
  element(:service_manager, "#user_role_service_manager+ label")
  element(:admin_team_user, "#user_role_admin_team_user+ label")
  element(:admin_team_leader, "#user_role_admin_team_lead+ label")
  element(:policy_advisor, "#user_role_policy_advisor+ label")

  def submit(args = {})
    user_email.set(args[:user_email]) if args.key?(:user_email)
    invite(args[:type])

    submit_button.click
  end

  private

  # rubocop:disable Metrics/CyclomaticComplexity
  def invite(type)
    case type
    when :customer_service_advisor
      customer_service_advisor.click
    when :data_viewer
      data_viewer.click
    when :finance_user
      finance_user.click
    when :developer
      developer.click
    when :service_manager
      service_manager.click
    when :admin_team_user
      admin_team_user.click
    when :admin_team_leader
      admin_team_leader.click
    when :policy_advisor
      policy_advisor.click
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity
end
