# frozen_string_literal: true

class SiteAddressPage < SitePrism::Page

  element(:error, ".error-summary")
  element(:heading, ".heading-large")

  element(:postcode, "#site_postcode_form_postcode")

  element(:find_address, "input[value='Find address']")

  element(:show_list, "input[id='address_match_selection']")
  element(:results_dropdown, "select#site_address_lookup_form_temp_address")

  element(:submit_button, "input[value='Continue']")

  def submit(args = {})
    postcode.set(args[:postcode]) if args.key?(:postcode)
    find_address.click

    results_dropdown.select(args[:result]) if args.key?(:result)

    submit_button.click
  end

end
