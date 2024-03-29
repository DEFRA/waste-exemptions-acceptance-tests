# frozen_string_literal: true

require_relative "sections/admin_menu_section"

class EditDetailsPage < BasePage

  section(:admin_menu_section, AdminMenuSection, AdminMenuSection::SELECTOR)

  element(:first_name_form, "#applicant_name_form_applicant_first_name")
  element(:last_name_form, "#applicant_name_form_applicant_last_name")
  element(:operator_name_form, "#operator-name-form-operator-name-field")
  element(:contact_email_form1, "#contact_email_form_contact_email")
  element(:contact_email_form2, "#contact_email_form_confirmed_email")

  def submit(args = {})
    first_name_form.set(args[:first_name]) if args.key?(:first_name)
    last_name_form.set(args[:last_name]) if args.key?(:last_name)
    operator_name_form.set(args[:operator_name]) if args.key?(:operator_name)
    contact_email_form1.set(args[:contact_email]) if args.key?(:contact_email)
    contact_email_form2.set(args[:contact_email]) if args.key?(:contact_email)
    submit_button.click
  end

end
