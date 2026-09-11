# frozen_string_literal: true

class AdminMenuSection < SitePrism::Section

  # GOV.UK black banner and menu items

  SELECTOR = ".govuk-service-navigation__list"

  element(:home_page, ".govuk-service-navigation__item:nth-child(1) .govuk-service-navigation__link")
  element(:user_management, "a[href='/users']")
  element(:data_exports, "a[href*='/data-exports']")
  element(:toggle_features_link, "a[href*='/features/feature-toggles']")
  element(:band_management, "a[href*='/bands']")
  element(:charge_management, "a[href*='/exemptions']")
  element(:linear_registrations, "a[href*='/registrations/linear']")
end
