class ChooseExemptionsPage < SitePrism::Page

  elements(:exemptions, "input[name='exemptions_form[exemptions][]']", visible: false)

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
