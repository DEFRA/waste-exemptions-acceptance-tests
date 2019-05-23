# frozen_string_literal: true

require_relative "sections/admin_menu_section.rb"

class EditDetailsPage < SitePrism::Page

  section(:admin_menu_section, AdminMenuSection, AdminMenuSection::SELECTOR)

  element(:heading, ".heading-large")
  element(:first_name_form, "#applicant_name_form_first_name")
  element(:last_name_form, "#applicant_name_form_last_name")
  element(:operator_name_form, "#operator_name_form_operator_name")
  element(:contact_email_form_1, "#contact_email_form_contact_email")
  element(:contact_email_form_2, "#contact_email_form_confirmed_email")

  element(:continue_button, ".button")

  def submit(args = {})
    first_name_form.set(args[:first_name]) if args.key?(:first_name)
    last_name_form.set(args[:last_name]) if args.key?(:last_name)
    operator_name_form.set(args[:operator_name]) if args.key?(:operator_name)
    contact_email_form_1.set(args[:contact_email]) if args.key?(:contact_email)
    contact_email_form_2.set(args[:contact_email]) if args.key?(:contact_email)
    continue_button.click
  end

end
