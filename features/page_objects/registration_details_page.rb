class RegistrationDetailsPage < SitePrism::Page

  element(:site_section, :xpath, "html/body/section/main/div/div/div/div[1]/div[3]/div/div/div[1]/div/div[2]/a/span")
  element(:ngr, :xpath, ".//*[@id='site-tab']/div/table/tbody/tr[2]/td[2]")
  element(:area, :xpath, ".//*[@id='site-tab']/div/table/tbody/tr[4]/td[2]")
  element(:registration_status, :xpath, ".//*[@id='registration']/div/table/tbody/tr[3]/td[2]/span")
  element(:deregister, "#deregister-enrollment")
  element(:exemption_details_section, ".row:nth-child(3) .col-xs-11")
  element(:deregister_first_exemption, ".enrollment_exemption:nth-of-type(1) .btn")
  element(:deregister_last_exemption, ".enrollment_exemption:nth-of-type(2) .btn")
  element(:first_exemption_status, ".enrollment_exemption:nth-of-type(1) td:nth-of-type(4)")
  section(:nav_bar, AdminNavBarSection, ".add-bottom-margin .container")

end
