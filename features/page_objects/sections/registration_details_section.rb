# frozen_string_literal: true

class RegistrationDetailsSection < SitePrism::Section

  # IMPORTANT! This section is visible when the page is first loaded, so you
  # should be able to interact with it directly (i.e. not click 'it' as is the
  # case with some other sections). But do bear in mind it does have the ability
  # to b collapsed, at which point it would need to be clicked.
  #
  # @app.registration_details_page.registration_details.expander_link.click
  # @app.registration_details_page.exemption_details.first_deregister_btn.click
  #
  # When adding it to your pages use
  # section(:registration_details, RegistrationDetailsSection, RegistrationDetailsSection::SELECTOR)

  SELECTOR ||= ".col-sm-9 .row:nth-child(2) .panel-default"

  element(:expander_link, "a[href='#registration-details']")

  element(:reference, "#registration tr:nth-child(1) td+ td")
  element(:assistance, "#registration span[data-toggle='tooltip']")
  element(:status, "#registration tr:nth-child(3) td+ td")
  element(:date_of_registration, "#registration tr:nth-child(4) td+ td")

end
