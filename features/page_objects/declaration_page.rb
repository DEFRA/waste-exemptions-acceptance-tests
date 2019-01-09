class DeclarationPage < SitePrism::Page

  element(:declaration_checkbox, "#declaration_form_declaration", visible: false)
  element(:submit_button, "input[type='submit']")

  def submit(_args = {})
    declaration_checkbox.click
    submit_button.click
  end

end
