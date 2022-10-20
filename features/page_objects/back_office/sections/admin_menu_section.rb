# frozen_string_literal: true

class AdminMenuSection < SitePrism::Section

  # GOV.UK black banner and menu items

  SELECTOR = ".govuk-header"

  element(:home_page, ".govuk-header__link--service-name")
  element(:user_management, "a[href='/users']")
  element(:dashboard_link, "li:nth-child(1) a")
  element(:data_exports, "a[href*='/data-exports']")
  element(:toggle_features_link, "a[href*='/features/feature-toggles']")

end
