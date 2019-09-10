# frozen_string_literal: true

class HomePage < SitePrism::Page

  set_url("/")

  element(:error, ".error-summary")
  element(:submit_button, "input[name='commit']")

end
