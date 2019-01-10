class ApplicantPhonePage < SitePrism::Page

  element(:tel_number, "#applicant_phone_form_phone_number")

  element(:submit_button, "input[type='submit']")

  def submit(args = {})
    tel_number.set(args[:tel_number]) if args.key?(:tel_number)

    submit_button.click
  end

end
