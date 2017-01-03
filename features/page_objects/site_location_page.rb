class SiteLocationPage < SitePrism::Page

  element(:postcode, "input[id='find_address']")

  element(:find_address, "input[value='Find address']")

  element(:show_list, "input[id='address_match_selection']")
  element(:results_dropdown, "select#address_match_selection")
  element(:last_result, "select#address_match_selection option:last-of-type")

  element(:grid_ref_helper, "summary[id='show-hide-details-summary-1']")

  element(:grid_ref, "input[id='text_field_grid_reference']")
  element(:site_details, "textarea[id='text_area_site_info']")

  element(:submit_button, "input[value='Continue']")

  def submit_address(args = {})
    postcode.set(args[:postcode]) if args.key?(:postcode)
    find_address.click
    last_result.select_option
    submit_button.click
  end

  def submit_grid_ref(args = {})
    grid_ref_helper.click
    grid_ref.set(args[:grid_ref]) if args.key?(:grid_ref)
    site_details.set(args[:site_details]) if args.key?(:site_details)
    submit_button.click
  end
end
