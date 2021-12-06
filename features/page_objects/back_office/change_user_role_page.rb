# frozen_string_literal: true

require_relative "sections/admin_menu_section"

class ChangeUserRolePage < BasePage

  section(:admin_menu, AdminMenuSection, AdminMenuSection::SELECTOR)

  element(:user_details, "form p")

  element(:system, "#user_role_system + label")
  element(:super, "#user_role_super_agent + label")
  element(:admin, "#user_role_admin_agent + label")
  element(:data, "#user_role_data_agent + label")

  def submit(args = {})
    # As long as the arg passed in matches the name of an element we can simply
    # invoke the element using ruby's send() method. In this way we can avoid
    # overly long case/switch statements that check the value of the arg to
    # determine which element to select
    send(args[:role]).select_option

    submit_button.click
  end

end
