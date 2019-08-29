# frozen_string_literal: true

class ApplicantNamePage < SitePrism::Page

  element(:heading, ".heading-large")

  element(:first_name, "#applicant_name_form_applicant_first_name")
  element(:last_name, "#applicant_name_form_applicant_last_name")
  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    first_name.set(args[:first_name]) if args.key?(:first_name)
    last_name.set(args[:last_name]) if args.key?(:last_name)
    submit_button.click
  end

end
