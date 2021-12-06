# frozen_string_literal: true

class BusinessTypePage < BasePage

  element(:individual, "#business-type-form-business-type-soletrader-field + label")
  element(:limited_company, "#business-type-form-business-type-limitedcompany-field + label")
  element(:partnership, "#business-type-form-business-type-partnership-field + label")
  element(:llp, "#business-type-form-business-type-limitedliabilitypartnership-field + label")
  element(:local_authority, "#business-type-form-business-type-localauthority-field + label")
  element(:charity, "#business-type-form-business-type-charity-field + label")

  def submit(args = {})
    # As long as the arg passed in matches the name of an element we can simply
    # invoke the element using ruby's send() method. In this way we can avoid
    # overly long case/switch statements that check the value of the arg to
    # determine which element to select
    send(args[:business_type]).select_option

    submit_button.click
  end

end
