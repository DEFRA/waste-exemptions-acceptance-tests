# frozen_string_literal: true

class PhonePage < BasePage

  element(:tel_no, "input[id*='phone']")

  def submit(args = {})
    tel_no.set(args[:tel_no]) if args.key?(:tel_no)

    submit_button.click
  end

end
