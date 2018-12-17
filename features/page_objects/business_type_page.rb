class BusinessTypePage < SitePrism::Page

  element(:individual, "input[value='soleTrader']", visible: false)
  element(:limited, "input[value='limitedCompany']", visible: false)
  element(:partnership, "input[value='partnership']", visible: false)
  element(:llp, "input[value='limitedLiabilityPartnership']", visible: false)
  element(:local_authority, "input[value='localAuthority']", visible: false)
  element(:charity, "input[value='charity']", visible: false)

  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    case args[:type]
    when :individual
      individual.select_option
    when limited
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
