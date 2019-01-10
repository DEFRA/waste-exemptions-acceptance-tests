require_relative "../sections/admin_nav_bar_section"
require_relative "../sections/exemption_details_section"
require_relative "../sections/registration_details_section"
require_relative "../sections/site_details_section"

class RegistrationPage < SitePrism::Page

  element(:deregister_btn, "#deregister-enrollment")

  section(:nav_bar, AdminNavBarSection, AdminNavBarSection::SELECTOR)
  section(:exemption_details, ExemptionDetailsSection, ExemptionDetailsSection::SELECTOR)
  section(:site_details, SiteDetailsSection, SiteDetailsSection::SELECTOR)
  section(:registration_details, RegistrationDetailsSection, RegistrationDetailsSection::SELECTOR)

end
