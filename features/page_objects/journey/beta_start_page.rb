# frozen_string_literal: true

class BetaStartPage < BasePage

  def submit(_args = {})
    submit_button.click
  end

end
