# frozen_string_literal: true

class RenewChoicePage < SitePrism::Page

  element(:content, "#new_renewal_start_form")
  element(:heading, ".heading-large")

  element(:renew_without_changes_radio, "#renewal_start_form_temp_renew_without_changes_true + label")
  element(:renew_with_changes_radio, "#renewal_start_form_temp_renew_without_changes_false + label")
  element(:continue_button, ".button")

end
