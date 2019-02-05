class GovukBanner < SitePrism::Section

  # GOV.UK black banner and menu items

  SELECTOR ||= "#global-header".freeze

  element(:home_page, "#proposition-name")
  element(:user_management, "a[href='/users']")

end
