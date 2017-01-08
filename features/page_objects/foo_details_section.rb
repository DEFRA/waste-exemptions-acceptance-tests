class FooDetailsSection < SitePrism::Section

  # IMPORTANT! The section is hidden when the page is first loaded you, so to
  # see its details you first need to click 'it'. For example to 'see' i.e. be
  # able to get the text for site_address you first have to click on
  # expander_link
  #
  # @app.registration_page.site_details.expander_link.click
  # @app.registration_page.site_details.site_address.text
  #
  # This is just a factor of how bootstrap works.
  #
  # When adding it to your pages use
  # section(:site_details, FooDetailsSection, FooDetailsSection::SELECTOR)

  SELECTOR = ".col-sm-9 .row:nth-child(4) .panel-default".freeze

  element(:expander_link, "a[href='#site-details']")

  element(:site_address, "#site-tab tr:nth-child(1) td+ td")
  element(:grid_reference, "#site-tab tr:nth-child(2) td+ td")
  element(:site_info, "#site-tab tr:nth-child(3) td+ td")
  element(:area, "#site-tab tr:nth-child(4) td+ td")

end
