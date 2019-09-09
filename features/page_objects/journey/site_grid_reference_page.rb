# frozen_string_literal: true

class SiteGridReferencePage < SitePrism::Page

  element(:error, ".error-summary")
  element(:heading, ".heading-large")

  element(:postcode, "input[id='find_address']")

  element(:find_address, "input[value='Find address']")

  element(:show_list, "input[id='address_match_selection']")
  element(:results_dropdown, "select#address_match_selection")
  element(:last_result, "select#address_match_selection option:last-of-type")

  element(:choose_address, "a[href^='/site-grid-reference/skip_to_address']")

  element(:grid_ref_helper, ".summary")

  element(:grid_ref, "#site_grid_reference_form_grid_reference")
  element(:site_details, "#site_grid_reference_form_description")

  element(:submit_button, "input[value='Continue']")

  def submit_address(args = {})
    postcode.set(args[:postcode]) if args.key?(:postcode)
    find_address.click
    last_result.select_option
    submit_button.click
  end

  def submit(args = {})
    grid_ref.set(args[:grid_ref]) if args.key?(:grid_ref)
    site_details.set(args[:site_details]) if args.key?(:site_details)
    submit_button.click
  end
end
