# frozen_string_literal: true

class GovukBanner < SitePrism::Section

  # GOV.UK black banner and menu items

  SELECTOR ||= "#global-header"

  element(:home_page, "#proposition-name")
  element(:user_management, "a[href='/users']")

end
