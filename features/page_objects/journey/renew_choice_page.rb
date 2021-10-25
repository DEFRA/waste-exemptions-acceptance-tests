# frozen_string_literal: true

class RenewChoicePage < BasePage

  element(:content, "#new_renewal_start_form")

  element(:renew_without_changes_radio, "input[value='true'] + label")
  element(:renew_with_changes_radio, "input[value='false'] + label")

end
