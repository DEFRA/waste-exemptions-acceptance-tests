# frozen_string_literal: true

class ReviewingPartnersPage < SitePrism::Page
  element(:add_partner, ".form-group .ignore-visited")

  element(:submit_button, "input[value='Continue']")

  def submit(_args = {})
    submit_button.click
  end

end
