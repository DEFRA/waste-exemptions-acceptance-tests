class ChooseExemptionsPage < SitePrism::Page

  element(:how_to_tab, "#tablist1-tab1")
  element(:using_waste_tab, "#tablist1-tab2")
  element(:treating_waste_tab, "#tablist1-tab3")
  element(:disposing_waste_tab, "#tablist1-tab4")
  element(:storing_waste_tab, "#tablist1-tab5")

  elements(:exemptions, "input[name='enrollment[enrollment_exemptions_attributes][exemption_ids][]']")

  element(:submit_button, "input[name='commit']")

  # Takes each exemption number in the array
  # Identifies what tab that exemption is on using the identify_tab method
  # Selects that tab using the select_tab method
  # Then clicks on the relevant checkbox for that exemption number
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
    when "S"
      :storing_waste_tab
    when "U"
      :using_waste_tab
    when "T"
      :treating_waste_tab
    when "D"
      :disposing_waste_tab
    end
  end

  def select_tab(tab)
    case tab
    when :using_waste_tab
      using_waste_tab.click
    when :treating_waste_tab
      treating_waste_tab.click
    when :disposing_waste_tab
      disposing_waste_tab.click
    when :storing_waste_tab
      storing_waste_tab.click
    end
  end

  def select_tab_by_title(title)
    case title.downcase
    when "how to add"
      how_to_tab
    when "using waste"
      using_waste_tab
    when "treating waste"
      treating_waste_tab
    when "disposing of waste"
      disposing_waste_tab
    when "storing waste"
      storing_waste_tab
    end
  end

end
