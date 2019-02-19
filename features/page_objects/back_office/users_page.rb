require_relative "sections/govuk_banner.rb"

class UsersPage < SitePrism::Page

  section(:govuk_banner, GovukBanner, GovukBanner::SELECTOR)

  element(:invite_user, "a[href='/users/invitation/new']")

end
