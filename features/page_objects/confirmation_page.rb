class ConfirmationPage < SitePrism::Page

  # .text method exposes reference number
  # @exemption_number = @app.confirmation_page.ref_no.text
  element(:ref_no, '.reference-number')

end
