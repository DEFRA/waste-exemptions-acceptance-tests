# frozen_string_literal: true

class BusinessTypePage < SitePrism::Page

  element(:individual, "#business_type_form_business_type_soletrader + label")
  element(:limited_company, "#business_type_form_business_type_limitedcompany + label")
  element(:partnership, "#business_type_form_business_type_partnership + label")
  element(:llp, "#business_type_form_business_type_limitedliabilitypartnership + label")
  element(:local_authority, "#business_type_form_business_type_localauthority + label")
  element(:charity, "#business_type_form_business_type_charity + label")

  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    # As long as the arg passed in matches the name of an element we can simply
    # invoke the element using ruby's send() method. In this way we can avoid
    # overly long case/switch statements that check the value of the arg to
    # determine which element to select
    send(args[:business_type]).select_option

    submit_button.click
  end

end
