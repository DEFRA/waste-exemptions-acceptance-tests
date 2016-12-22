class ChooseExemptionsPage < SitePrism::Page

  element(:waste_tab, "li[id='tablist1-tab2']")

  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    full_name.set(args[:full_name]) if args.key?(:full_name)
    tel_number.set(args[:tel_number]) if args.key?(:tel_number)
    email.set(args[:email]) if args.key?(:email)
    confirm_email.set(args[:confirm_email]) if args.key?(:confirm_email)

    submit_button.click
  end

end
