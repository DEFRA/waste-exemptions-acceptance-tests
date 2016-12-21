class ContactDetailsPage < SitePrism::Page

  element(:full_name, "input[id='full_name']")
  element(:tel_number, "input[id='tel_number']")
  element(:email, "input[id='email_address']")
  element(:confirm_email, "input[id='email_address_confirmation']")

  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    full_name.set(args[:full_name]) if args.key?(:full_name)
    tel_number.set(args[:tel_number]) if args.key?(:tel_number)
    email.set(args[:email]) if args.key?(:email)
    confirm_email.set(args[:confirm_email]) if args.key?(:confirm_email)

    submit_button.click
  end

end
