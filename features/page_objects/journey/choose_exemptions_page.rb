# frozen_string_literal: true

class ChooseExemptionsPage < BasePage

  elements(:exemptions, "input[name$='exemptions_form[exemption_ids][]']", visible: false)

  def submit(args = {})
    if args.key?(:exemptions)
      args[:exemptions].each do |ex|

        search_val = if args.key?(:renewal)
                       "renew_exemptions_form_checkbox-#{ex}"
                     else
                       "exemptions_form_checkbox-#{ex}"
                     end
                     puts search_val
        exemptions.find { |chk| chk["id"] == search_val }.click
      end
    end

    submit_button.click
  end

  # def renew(args = {})
  #   if args.key?(:exemptions)
  #     args[:exemptions].each do |ex|
  #       search_val = "renew_exemptions_form_checkbox-#{ex}"
  #       exemptions.find { |chk| chk["id"] == search_val }.click
  #     end
  #   end

  #   submit_button.click
  # end

  def uncheck_all_exemptions_and_submit
    exemptions.each do |ex|
      ex.click if ex.checked?
    end
    submit_button.click
  end

end
