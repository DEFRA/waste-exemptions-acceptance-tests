# frozen_string_literal: true

class ContactPositionPage < SitePrism::Page

  element(:error, ".error-summary")
  element(:heading, ".heading-large")

  element(:position, "#contact_position_form_contact_position")

  element(:submit_button, "input[type='submit']")

  def submit(args = {})
    position.set(args[:position]) if args.key?(:position)

    submit_button.click
  end

end
