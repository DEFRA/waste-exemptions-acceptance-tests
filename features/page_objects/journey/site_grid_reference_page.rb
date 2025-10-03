# frozen_string_literal: true

class SiteGridReferencePage < BasePage

  element(:grid_ref_helper, ".govuk-details__summary-text")
  element(:grid_ref,
          "#site-grid-reference-form-grid-reference-field,#multisite-site-grid-reference-form-grid-reference-field")
  element(:site_details,
          "#site-grid-reference-form-description-field,#multisite-site-grid-reference-form-description-field")
  element(:choose_address, "a[href*='/skip_to_address']")

  def submit(args = {})
    grid_ref.set(args[:grid_ref]) if args.key?(:grid_ref)
    site_details.set(args[:site_details]) if args.key?(:site_details)
    submit_button.click
  end
end
