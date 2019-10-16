# frozen_string_literal: true

class ChooseExemptionsPage < SitePrism::Page

  element(:error, ".error-summary")
  element(:heading, ".heading-large")

  elements(:exemptions, "input[name='exemptions_form[exemption_ids][]']", visible: false)

  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    if args.key?(:exemptions)
      args[:exemptions].each do |ex|
        search_val = "exemptions_form_checkbox-#{ex}"
        exemptions.find { |chk| chk["id"] == search_val }.click
      end
    end

    submit_button.click
  end

end
