# frozen_string_literal: true

class DeclarationPage < SitePrism::Page

  element(:error, ".error-summary")

  element(:declaration_checkbox, "#declaration_form_declaration+ label")
  element(:submit_button, "input[type='submit']")

  def submit(_args = {})
    declaration_checkbox.click
    submit_button.click
  end

end
