# frozen_string_literal: true

class FrontOfficeEditDeclarationPage < BasePage

  element(:declaration_checkbox, "input[id*='declaration-form']+ label")

  def submit(_args = {})
    declaration_checkbox.click
    submit_button.click
  end

end
