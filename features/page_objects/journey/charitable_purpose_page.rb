# frozen_string_literal: true

class CharitablePurposePage < BasePage

  # Will this waste operation take place on a farm?
  element(:no, "#charitable-purpose-form-charitable-purpose-field + label")
  element(:yes, "#charitable-purpose-form-charitable-purpose-true-field + label")

  def submit(args = {})
    if args[:charity]
      yes.click
    else
      no.click
    end

    submit_button.click
  end

end
