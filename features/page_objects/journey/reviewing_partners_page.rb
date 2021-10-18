# frozen_string_literal: true

class ReviewingPartnersPage < BasePage

  element(:add_partner, ".form-group .ignore-visited")

  def submit(_args = {})
    submit_button.click
  end

end
