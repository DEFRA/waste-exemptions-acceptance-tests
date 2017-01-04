class RegistrationDetailsPage < SitePrism::Page

  element(:deregister, "#deregister-enrollment")

  section(:nav_bar, AdminNavBarSection, ".add-bottom-margin .container")

end
