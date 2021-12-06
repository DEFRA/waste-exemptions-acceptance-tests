# frozen_string_literal: true

class AddressLookupPage < BasePage

  # This is a generic page object file for contact and operator address, to prevent repetition.
  # Although the page objects have different identifiers, they follow the same pattern
  # and so each field can be identified through what its id contains.

  # The following is common to operator, contact and site postcode forms:
  element(:postcode, "input[id*='postcode-field']")

  # Search results as a dropdown
  element(:show_list, "input[id='address_match_selection']")
  element(:results_dropdown, "select[id*='address_uprn']")
  element(:cannot_find_address, "a[href*='address-lookup/skip']")

  def submit(args = {})
    enter_postcode(args[:postcode]) if args.key?(:postcode)
    results_dropdown.select(args[:result]) if args.key?(:result)
    submit_button.click
  end

  def enter_postcode(postcode_entry)
    postcode.set(postcode_entry)
    submit_button.click
  end

  def choose_manual_address(args = {})
    enter_postcode(args[:postcode]) if args.key?(:postcode)
    cannot_find_address.click
  end

end
