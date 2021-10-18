# frozen_string_literal: true

class ConfirmationPage < BasePage

  # .text method exposes reference number
  # @exemption_number = @app.confirmation_page.ref_no.text
  element(:confirmation_box, ".govuk-box-highlight")
  element(:ref_no, ".strong")

end
