# frozen_string_literal: true

class AdminMenuSection < SitePrism::Section

  # GOV.UK black banner and menu items

  SELECTOR ||= "#global-header"

  element(:home_page, "#proposition-name")
  element(:user_management, "a[href='/users']")
  element(:dashboard_link, "li:nth-child(1) a")
  element(:download_letters_link, "a[href*='/letters']")
  element(:data_exports, "a[href*='/data-exports']")
  element(:toggle_features_link, "a[href*='/features/feature-toggles']")

end
