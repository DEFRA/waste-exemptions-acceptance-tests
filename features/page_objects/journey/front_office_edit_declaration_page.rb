# frozen_string_literal: true

class FrontOfficeEditDeclarationPage < BasePage

  element(:declaration_checkbox, "input[id*='front-office-edit-declaration-form-declaration']+ label")

  def submit(_args = {})
    declaration_checkbox.click
    submit_button.click
  end

end
