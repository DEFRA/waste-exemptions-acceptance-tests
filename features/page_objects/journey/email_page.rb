# frozen_string_literal: true

class EmailPage < BasePage
  # rubocop:disable Layout/LineLength
  element(:email, "input[id^='applicant-email-form-applicant-email-field'],input[id^='contact-email-form-contact-email-field']")
  # rubocop:enable Layout/LineLength
  element(:confirm_email, "input[id*='confirmed-email']")
  element(:no_email_option, "input[id$='no-email-address-1-field']", visible: false)

  def submit(args = {})
    email.set(args[:email]) if args.key?(:email)
    confirm_email.set(args[:confirm_email]) if args.key?(:confirm_email)
    no_email_option.click if args.key?(:no_email)
    submit_button.click
  end

end
