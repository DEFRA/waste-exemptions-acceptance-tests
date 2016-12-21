class CorrespondenceContactPage < SitePrism::Page

  element(:full_name, "input[id='full_name']")
  element(:position, "input[id='position']")
  element(:tel_number, "input[id='tel_number']")
  element(:premises, "input[id='premises']")
  element(:street_address, "input[id='street_address']")
  element(:locality, "input[id='locality']")
  element(:city, "input[id='city']")
  element(:postcode, "input[id='postcode']")
  element(:email_address, "input[id='email_address']")
  element(:email_address_confirmation, "input[id='email_address_confirmation']")

  element(:submit_button, "input[value='Continue']")

  def submit(args = {})
    tel_number.set(args[:tel_number]) if args.key?(:tel_number)

    submit_button.click
  end

end
