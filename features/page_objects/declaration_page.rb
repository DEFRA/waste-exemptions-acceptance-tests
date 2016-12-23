class DeclarationPage < SitePrism::Page

  element(:submit_button, "input[name='commit']")

  def submit(_args = {})
    submit_button.click
 end

end
