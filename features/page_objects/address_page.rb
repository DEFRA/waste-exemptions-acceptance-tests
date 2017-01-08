class AddressPage < SitePrism::Page

  element(:postcode, "input[id='find_address']")

  element(:find_address, "input[value='Find address']")

  element(:show_list, "input[id='address_match_selection']")
  element(:results_dropdown, "select#address_match_selection")

  element(:submit_button, "input[value='Continue']")

  def submit(args = {})
    postcode.set(args[:postcode]) if args.key?(:postcode)
    find_address.click

    results_dropdown.select(args[:result]) if args.key?(:result)

    submit_button.click
  end

end
