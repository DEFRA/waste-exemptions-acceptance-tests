# frozen_string_literal: true

class CharitablePurposeDeclarationPage < BasePage

  element(:declaration_checkbox,
          "input[id*='charitable-purpose-declaration-form-charitable-purpose-declaration-1-field']+ label")

  def submit(_args = {})
    declaration_checkbox.click
    submit_button.click
  end

end
