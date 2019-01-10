class OperatorAddressPage < SitePrism::Page

  element(:house_no, "#operator_address_manual_form_premises")
  element(:address_line_one, "#operator_address_manual_form_street_address")
  element(:address_line_two, "#operator_address_manual_form_locality")
  element(:city, "#operator_address_manual_form_city")
  element(:postcode, "#operator_postcode_form_postcode")

  element(:find_address, "input[value='Find address']")
  element(:cannot_find_address, "a[href^='/operator-address-lookup/skip']")

  element(:show_list, "input[id='address_match_selection']")
  element(:results_dropdown, "select#operator_address_lookup_form_temp_address")

  element(:submit_button, "input[value='Continue']")

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
