class ContactAddressPage < SitePrism::Page

  element(:postcode, "#contact_postcode_form_postcode")

  element(:find_address, "input[value='Find address']")

  element(:show_list, "input[id='address_match_selection']")
  element(:results_dropdown, "select#contact_address_lookup_form_temp_address")

  element(:submit_button, "input[value='Continue']")

  def submit(args = {})
    postcode.set(args[:postcode]) if args.key?(:postcode)
    find_address.click

    results_dropdown.select(args[:result]) if args.key?(:result)

    submit_button.click
  end

end
