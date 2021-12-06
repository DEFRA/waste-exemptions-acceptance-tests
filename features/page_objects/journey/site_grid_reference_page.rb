# frozen_string_literal: true

class SiteGridReferencePage < BasePage

  element(:postcode, "input[id='find_address']")

  element(:find_address, "input[value='Find address']")

  element(:show_list, "input[id='address_match_selection']")
  element(:results_dropdown, "select#address_match_selection")
  element(:last_result, "select#address_match_selection option:last-of-type")

  element(:choose_address, "a[href^='/site-grid-reference/skip_to_address']")

  element(:grid_ref_helper, ".govuk-details__summary-text")

  element(:grid_ref, "#site-grid-reference-form-grid-reference-field")
  element(:site_details, "#site-grid-reference-form-description-field")

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
