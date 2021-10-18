# frozen_string_literal: true

class ContactPositionPage < BasePage

  element(:position, "#contact-position-form-contact-position-field")

  def submit(args = {})
    position.set(args[:position]) if args.key?(:position)

    submit_button.click
  end

end
