class ChooseExemptionsPage < SitePrism::Page

  element(:using_waste, "li[id='tablist1-tab2']")
  element(:treating_waste, "li[id='tablist1-tab3']")
  element(:disposing_waste, "li[id='tablist1-tab4']")
  element(:storing_waste, "li[id='tablist1-tab5']")

  elements(:exemptions, "input[name='enrollment[enrollment_exemptions_attributes][exemption_ids][]']")

  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    if args.key?(:exemption)
      exemptions.find { |chk| chk['value'] == args[:exemption] }.click
    end

    submit_button.click
  end

end