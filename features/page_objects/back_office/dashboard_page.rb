# frozen_string_literal: true

require_relative "sections/admin_menu_section.rb"

class DashboardPage < SitePrism::Page

  set_url(Quke::Quke.config.custom["urls"]["back_office"])

  section(:admin_menu, AdminMenuSection, AdminMenuSection::SELECTOR)

  element(:content, "#content")
  element(:heading, ".heading-large")
  element(:search_term, "#term")

  # The + label identifiers below work when the visible:false flags don't:
  element(:submitted_filter, "#filter_registrations + label")
  element(:unsubmitted_filter, "#filter_new_registrations + label")

  element(:create_new_registration, "a[href='/ad-privacy-policy']")

  element(:submit_button, "input[name='commit']")
  element(:sign_out_button, ".user-info .button")

  elements(:results, ".registration-list")

  element(:revoked_tag, ".status-tag-revoked")
  element(:ceased_tag, ".status-tag-ceased")
  elements(:view_transient_details_links, "a[href*='new-registrations']")
  elements(:view_reg_details_links, "a[href*='/registrations/']")
  elements(:resume_links, "[id^=resume]")
  elements(:confirmation_letter_links, "a[href*='confirmation-letter']")

  def view_link(registration_number)
    find(:css, "#view_#{registration_number}")
  end

  def edit_link(registration_number)
    find(:css, "#edit_#{registration_number}")
  end

  def deregister_link(registration_number)
    find(:css, "#deregister_#{registration_number}")
  end

  def resume_link(registration_number)
    find(:css, "#resume_#{registration_number}")
  end

  def confirmation_letter_link(registration_number)
    find(:css, "#confirmation_letter_#{registration_number}")
  end

  def submit(args = {})
    search_term.set(args[:search_term]) if args.key?(:search_term)

    submit_button.click
  end

end
