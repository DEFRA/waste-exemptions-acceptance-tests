# frozen_string_literal: true

class AddressPage < SitePrism::Page

  # This is a generic page object file for contact and operator address, to prevent repetition.
  # Although the page objects have different identifiers, they follow the same pattern
  # and so each field can be identified through what its id contains.

  element(:error, ".error-summary")
  element(:heading, ".heading-large")

  # Postcode forms on individual screens are as follows, as from Sep '19:
  # #operator_postcode_form_temp_operator_postcode
  # #contact_postcode_form_temp_contact_postcode
  # #site_postcode_form_temp_site_postcode
  element(:postcode, "input[id*='postcode_form_temp']")
  element(:find_address, "input[value='Find address']")

  # Search results as a dropdown
  element(:show_list, "input[id='address_match_selection']")
  element(:results_dropdown, "select[id*='address_lookup_form_temp_address']")
  element(:cannot_find_address, "a[href*='address-lookup/skip']")
  element(:enter_address_manually, "a[href*='/operator-postcode/skip_to_manual_address']")

  # Page objects for when the address can't be found
  element(:house_no, "input[id*='address_manual_form_premises']")
  element(:address_line_one, "input[id*='address_manual_form_street_address']")
  element(:address_line_two, "input[id*='address_manual_form_locality']")
  element(:city, "input[id*='address_manual_form_city']")

  element(:submit_button, ".button")

  def submit(args = {})
    postcode.set(args[:postcode]) if args.key?(:postcode)
    find_address.click
    results_dropdown.select(args[:result]) if args.key?(:result)
    submit_button.click
  end

  def submit_manual_address(args = {})
    postcode.set(args[:postcode]) if args.key?(:postcode)
    find_address.click
    cannot_find_address.click
    house_no.set(args[:house_no]) if args.key?(:house_no)
    address_line_one.set(args[:address_line_one]) if args.key?(:address_line_one)
    address_line_two.set(args[:address_line_two]) if args.key?(:address_line_two)
    city.set(args[:city]) if args.key?(:city)
    submit_button.click
  end

end
