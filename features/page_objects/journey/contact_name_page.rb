# frozen_string_literal: true

class ContactNamePage < BasePage

  element(:first_name, "#contact-name-form-contact-first-name-field")
  element(:last_name, "#contact-name-form-contact-last-name-field")

  def submit(args = {})
    first_name.set(args[:first_name]) if args.key?(:first_name)
    last_name.set(args[:last_name]) if args.key?(:last_name)

    submit_button.click
  end

end
