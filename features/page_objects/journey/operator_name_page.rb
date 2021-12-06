# frozen_string_literal: true

class OperatorNamePage < BasePage

  element(:org_name, "input[id^='operator-name-form-operator-name-field']", visible: false)

  def submit(args = {})
    org_name.set(args[:org_name]) if args.key?(:org_name)

    submit_button.click
  end

end
