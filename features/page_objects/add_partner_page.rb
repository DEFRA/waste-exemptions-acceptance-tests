class AddPartnerPage < SitePrism::Page
  element(:name, "#full_name")
  element(:postcode, "input[id='find_address']")

  element(:find_address, "input[value='Find address']")

  element(:show_list, "input[id='address_match_selection']")
  element(:results_dropdown, "select#address_match_selection")
  element(:last_result, "select#address_match_selection option:last-of-type")
  element(:submit_button, "input[value='Continue']")

  def submit(args = {})
    name.set(args[:name]) if args.key?(:name)
    postcode.set(args[:postcode]) if args.key?(:postcode)
    find_address.click
    last_result.select_option
    submit_button.click
  end

end
