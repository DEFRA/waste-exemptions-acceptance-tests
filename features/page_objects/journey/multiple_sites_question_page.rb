# frozen_string_literal: true

class MultipleSitesQuestionPage < BasePage

  element(:single_site,
          "#is-multisite-registration-form-is-multisite-registration-field+ .govuk-radios__label")
  element(:multiple_site,
          "#is-multisite-registration-form-is-multisite-registration-true-field+ .govuk-radios__label")

  def submit(args = {})
    case args[:choice]
    when :single
      single_site.click
    when :multiple
      multiple_site.click
    end

    submit_button.click
  end

end
