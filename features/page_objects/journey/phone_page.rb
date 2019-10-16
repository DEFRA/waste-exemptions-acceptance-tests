# frozen_string_literal: true

class PhonePage < SitePrism::Page

  element(:error, ".error-summary")
  element(:tel_no, "input[id*='phone']")

  element(:submit_button, "input[type='submit']")

  def submit(args = {})
    tel_no.set(args[:tel_no]) if args.key?(:tel_no)

    submit_button.click
  end

end
