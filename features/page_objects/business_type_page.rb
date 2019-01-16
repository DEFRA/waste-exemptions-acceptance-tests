class BusinessTypePage < SitePrism::Page

  element(:individual, "#business_type_form_business_type_soletrader + label")
  element(:limited, "#business_type_form_business_type_limitedcompany + label")
  element(:partnership, "#business_type_form_business_type_partnership + label")
  element(:llp, "#business_type_form_business_type_limitedliabilitypartnership + label")
  element(:local_authority, "#business_type_form_business_type_localauthority + label")
  element(:charity, "#business_type_form_business_type_charity + label")

  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    case args[:business_type]
    when :individual
      individual.select_option
    when :limited
      limited.select_option
    when :partnership
      partnership.select_option
    when :llp
      llp.select_option
    when :local_authority
      local_authority.select_option
    when :charity
      charity.select_option
    end

    submit_button.click
  end

end
