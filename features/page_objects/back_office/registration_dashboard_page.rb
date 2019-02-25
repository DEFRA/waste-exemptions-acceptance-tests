require_relative "sections/govuk_banner.rb"

class RegistrationDashboardPage < SitePrism::Page

  section(:govuk_banner, GovukBanner, GovukBanner::SELECTOR)

  element(:search_term, "#term")
  element(:submit_button, "input[name='commit']")
  element(:create_new_registration, "a[href='/start/new']")

  def deregister(registration_number)
    element = "#" + "deregister_" + registration_number.to_s
    find(:css, element).click
  end

  def resume(registration_number)
    element = "#" + "resume_" + registration_number.to_s
    find(:css, element).click
  end

  def edit(registration_number)
    element = "#" + "edit_" + registration_number.to_s
    find(:css, element).click
  end

  def change_ad(registration_number)
    element = "#" + "change_ad_" + registration_number.to_s
    find(:css, element).text
  end

  def confirmation_letter(registration_number)
    element = "#" + "confirmation_letter_" + registration_number.to_s
    find(:css, element).text
  end

  def submit(args = {})
    search_term.set(args[:search_term]) if args.key?(:search_term)

    submit_button.click
  end

end
