# frozen_string_literal: true

class AdminMenuSection < SitePrism::Section

  # GOV.UK black banner and menu items

  SELECTOR ||= "#global-header"

  element(:home_page, "#proposition-name")
  element(:user_management, "a[href='/users']")
  element(:dashboard_link, "#proposition-links a")

end
