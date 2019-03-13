# frozen_string_literal: true

class ConfirmationPage < SitePrism::Page

  # .text method exposes reference number
  # @exemption_number = @app.confirmation_page.ref_no.text
  element(:ref_no, ".strong")

end
