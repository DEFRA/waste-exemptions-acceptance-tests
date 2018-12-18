class ContactPositionPage < SitePrism::Page

  element(:position, "#contact_position_form_position")

  element(:submit_button, "input[type='submit']")

  def submit(args = {})
    position.set(args[:position]) if args.key?(:position)

    submit_button.click
  end

end
