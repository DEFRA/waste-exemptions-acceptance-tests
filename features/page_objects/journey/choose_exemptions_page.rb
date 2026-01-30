# frozen_string_literal: true

class ChooseExemptionsPage < BasePage

  elements(:exemptions, "input[name*='exemptions_form']", visible: false)
  element(:exemption_fieldset, "#matched_exemptions")

  def submit(args = {})
    if args.key?(:exemptions)
      args[:exemptions].each do |ex|
        search_val = if args.key?(:farm)
                       "farm_exemptions_form_checkbox-#{ex}"
                     else
                       "activity_exemptions_form_checkbox-#{ex}"
                     end
        ex = exemptions.find { |chk| chk["id"] == search_val }
        ex.click unless ex.checked?
      end
    end
    submit_button.click
  end

  def uncheck_all_exemptions_and_submit
    exemptions.each do |ex|
      ex.click if ex.checked?
    end
    submit_button.click
  end

  def check_all_exemptions
    exemptions.each do |ex|
      ex.click unless ex.checked?
    end
  end

  def uncheck_exemption(exemption)
    search_val = "activity_exemptions_form_checkbox-#{exemption}"

    ex = exemptions.find { |chk| chk["id"] == search_val }
    ex.click if ex.checked?
  end

  def exemptions_displayed?(expected_text)
    page_text = exemption_fieldset.text

    return false if page_text.include?("Error")

    # Assume message contains all expected text unless proven otherwise:
    contains_all_text = true

    expected_text.each do |element|
      unless page_text.include?(element)
        contains_all_text = false
        break
      end
    end
    puts "Found exemptions: #{expected_text}" if contains_all_text
    return true if contains_all_text

    false
  end

end
