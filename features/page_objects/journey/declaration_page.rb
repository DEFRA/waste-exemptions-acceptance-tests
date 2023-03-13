# frozen_string_literal: true

class DeclarationPage < BasePage

  element(:declaration_checkbox, "input[id*='declaration-form-declaration']+ label")

  def submit(_args = {})
    declaration_checkbox.click
    submit_button.click
  end

end
