# frozen_string_literal: true

class AdminMenuSection < SitePrism::Section

  # GOV.UK black banner and menu items

  SELECTOR = ".govuk-header"

  element(:home_page, "#proposition-name")
  element(:user_management, "a[href='/users']")
  element(:dashboard_link, "li:nth-child(1) a")
  element(:data_exports, "a[href*='/data-exports']")
  element(:toggle_features_link, "a[href*='/features/feature-toggles']")
  element(:band_management, "a[href*='/bands']")
  element(:charge_management, "a[href*='/exemptions']")
  element(:linear_registrations, "a[href*='/registrations/linear']")
end
