require_relative "sections/govuk_banner.rb"

class RegistrationDashboardPage < SitePrism::Page

  section(:govuk_banner, GovukBanner, GovukBanner::SELECTOR)

  element(:search_term, "#term")
  element(:submit_button, "input[name='commit']")

  sections :results, ".registration-details" do
    element(:edit, "ul li:nth-child(1) a")
    element(:deregister, "ul li:nth-child(2) a")
    element(:resume, "ul li:nth-child(3) a")
    element(:change_ad, "ul li:nth-child(4) a")
    element(:letter, "ul li:nth-child(5) a")
  end

  def submit(args = {})
    search_term.set(args[:search_term]) if args.key?(:search_term)

    submit_button.click
  end

end
