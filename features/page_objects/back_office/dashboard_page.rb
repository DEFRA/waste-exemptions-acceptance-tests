# frozen_string_literal: true

require_relative "sections/admin_menu_section.rb"

class DashboardPage < SitePrism::Page

  set_url(Quke::Quke.config.custom["urls"]["back_office"])

  section(:admin_menu, AdminMenuSection, AdminMenuSection::SELECTOR)

  element(:search_term, "#term")
  element(:submitted_filter, "#filter_registrations + label")
  element(:unsubmitted_filter, "#filter_transient_registrations + label")

  element(:create_new_registration, "a[href='/start/new']")
  element(:change_password, "a[href='/users/password/edit']")

  element(:submit_button, "input[name='commit']")
  element(:sign_out_button, ".user-info .button")

  elements(:results, ".registration-list")

  elements(:resume_links, "[id^=resume]")

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
