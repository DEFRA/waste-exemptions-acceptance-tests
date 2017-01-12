class ExemptionDetailsSection < SitePrism::Section

  # IMPORTANT! The section is hidden when the page is first loaded you, so to
  # see its details you first need to click 'it'. For example to 'see' i.e. be
  # able to click the first_deregister_btn you first have to click on
  # expander_link
  #
  # @app.registration_page.exemption_details.expander_link.click
  # @app.registration_page.exemption_details.first_deregister_btn.click
  #
  # This is just a factor of how bootstrap works.
  #
  # When adding it to your pages use
  # section(:exemption_details, ExemptionDetailsSection, ExemptionDetailsSection::SELECTOR)

  SELECTOR = ".col-sm-9 .row:nth-child(3) .panel-default".freeze

  element(:expander_link, "a[href='#exemption-details']")

  # Because there is always one exemption, there will always be a first_
  element(:first_deregister_btn, ".enrollment_exemption:first-of-type a.btn")
  element(:first_exemption_status, ".enrollment_exemption:first-of-type span.label")

  # Whether there is a second exemption depends on the number of exemptions
  # added to the registration. However it serves as an example of how to get
  # any exemptions that lie between the first and the last.
  element(:second_deregister_btn, ".enrollment_exemption:nth-of-type(2) a.btn")
  element(:second_exemption_status, ".enrollment_exemption:nth-of-type(2) span.label")

  # Because there is always one exemption, there will always be a last_
  element(:last_deregister_btn, ".enrollment_exemption:last-of-type a.btn")
  element(:last_exemption_status, ".enrollment_exemption:last-of-type span.label")

end
