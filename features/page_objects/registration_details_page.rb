class RegistrationDetailsPage < SitePrism::Page
  element(:site_section, :xpath, "html/body/section/main/div/div/div/div[1]/div[3]/div/div/div[1]/div/div[2]/a/span")
  element(:ngr, :xpath, ".//*[@id='site-tab']/div/table/tbody/tr[2]/td[2]")
  element(:area, :xpath, ".//*[@id='site-tab']/div/table/tbody/tr[4]/td[2]")
  element(:deregister, "#deregister-enrollment")

  section(:nav_bar, AdminNavBarSection, ".add-bottom-margin .container")

end
