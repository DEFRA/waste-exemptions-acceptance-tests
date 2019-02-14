require_relative "sections/govuk_banner.rb"

class DeactivatePage < SitePrism::Page

  section(:govuk_banner, GovukBanner, GovukBanner::SELECTOR)

  element(:deactivate, "input[value='Deactivate']")

end
