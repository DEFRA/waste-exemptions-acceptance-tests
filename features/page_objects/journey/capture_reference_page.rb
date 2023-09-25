# frozen_string_literal: true

class CaptureReferencePage < BasePage

  element(:reference, "input[id^='capture-reference-form-reference-field']", visible: false)

  def submit(args = {})
    reference.set(args[:reference]) if args.key?(:reference)

    submit_button.click
  end
end
