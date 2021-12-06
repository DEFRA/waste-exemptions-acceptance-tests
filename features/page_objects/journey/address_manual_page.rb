# frozen_string_literal: true

class AddressManualPage < BasePage

  # This is a generic page object file for contact and operator address, to prevent repetition.
  # Although the page objects have different identifiers, they follow the same pattern
  # and so each field can be identified through what its id contains.

  # Page objects for when the address can't be found.
  # The page object identifiers vary in format depending on the address:
  element(:house_no, "input[id*='premises']")
  element(:address_line_one, "input[id*='street-address']")
  element(:address_line_two, "input[id*='locality']")
  element(:city, "input[id*='city']")

  def submit_manual_address(args = {})
    house_no.set(args[:house_no]) if args.key?(:house_no)
    address_line_one.set(args[:address_line_one]) if args.key?(:address_line_one)
    address_line_two.set(args[:address_line_two]) if args.key?(:address_line_two)
    city.set(args[:city]) if args.key?(:city)
    submit_button.click
  end

end
