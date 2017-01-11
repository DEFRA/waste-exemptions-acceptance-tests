class RegistrationPage < SitePrism::Page

  element(:deregister_btn, "#deregister-enrollment")

  section(:nav_bar, AdminNavBarSection, AdminNavBarSection::SELECTOR)
  section(:registration_details, RegistrationDetailsSection, RegistrationDetailsSection::SELECTOR)
  section(:exemption_details, ExemptionDetailsSection, ExemptionDetailsSection::SELECTOR)
  section(:site_details, SiteDetailsSection, SiteDetailsSection::SELECTOR)

end
