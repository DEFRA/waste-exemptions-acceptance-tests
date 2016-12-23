class ChooseExemptionsPage < SitePrism::Page

  # element(:using_waste, "li[id='tablist1-tab2']")
  element(:using_waste, '#tablist1-tab2')
  element(:treating_waste, "li[id='tablist1-tab3']")
  element(:disposing_waste, "li[id='tablist1-tab4']")
  element(:storing_waste, "li[id='tablist1-tab5']")

  elements(:exemptions, "input[name='enrollment[enrollment_exemptions_attributes][exemption_ids][]']")

  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    search_val = "checkbox-#{args[:exemption]}"

    select_tab(args[:tab])

    if args.key?(:exemption)
      exemptions.find { |chk| chk['id'] == search_val }.click
    end

    submit_button.click
  end

  def select_tab(tab)
    case tab
    when :using_waste
      using_waste.click
    when :treating_waste
      treating_waste.click
    when :disposing_waste
      disposing_waste.click
    when :storing_waste
      storing_waste.click
    end
  end

end
