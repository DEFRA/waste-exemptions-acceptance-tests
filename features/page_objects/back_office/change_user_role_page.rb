# frozen_string_literal: true

require_relative "sections/admin_menu_section"

class ChangeUserRolePage < BasePage

  section(:admin_menu, AdminMenuSection, AdminMenuSection::SELECTOR)

  element(:user_details, "form p")

  element(:customer_service_advisor, "#user_role_customer_service_adviser+ label")
  element(:data_viewer, "#user_role_data_viewer+ label")
  element(:finance_user, "#user_role_finance_user+ label")
  element(:developer, "#user_role_developer+ label")
  element(:service_manager, "#user_role_service_manager+ label")
  element(:admin_team_user, "#user_role_admin_team_user+ label")
  element(:admin_team_leader, "#user_role_admin_team_lead+ label")
  element(:policy_advisor, "#user_role_policy_advisor+ label")

  def submit(args = {})
    # As long as the arg passed in matches the name of an element we can simply
    # invoke the element using ruby's send() method. In this way we can avoid
    # overly long case/switch statements that check the value of the arg to
    # determine which element to select
    send(args[:role]).select_option

    submit_button.click
  end

end
