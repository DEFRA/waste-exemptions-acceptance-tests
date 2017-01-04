class ChooseExemptionsPage < SitePrism::Page

  # element(:using_waste, "li[id='tablist1-tab2']")
  element(:using_waste, "#tablist1-tab2")
  element(:treating_waste, "li[id='tablist1-tab3']")
  element(:disposing_waste, "li[id='tablist1-tab4']")
  element(:storing_waste, "li[id='tablist1-tab5']")

  elements(:exemptions, "input[name='enrollment[enrollment_exemptions_attributes][exemption_ids][]']")

  element(:submit_button, "input[name='commit']")

# Takes each exemption number in the array
# Identifies what tab that exemption is on using the identify_tab method
# Selects that tab using the select_tab method
#Then clicks on the relevant checkbox for that exemption number
  def submit(args = {})
    if args.key?(:exemptions)
      args[:exemptions].each do |ex|
        tab = identify_tab(ex)
        select_tab(tab)

        search_val = "checkbox-#{ex}"
        exemptions.find { |chk| chk["id"] == search_val }.click
      end
    end

    submit_button.click
  end

  def identify_tab(ex)
    case ex.chars.first
    when 'S'
      return :storing_waste
    when 'U'
      return :using_waste
    when 'T'
      return :treating_waste
    when 'D'  
      return :disposing_waste
    end

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
