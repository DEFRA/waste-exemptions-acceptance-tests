# frozen_string_literal: true

require_relative "sections/admin_menu_section.rb"

class UsersPage < SitePrism::Page

  set_url(File.join(Quke::Quke.config.custom["urls"]["back_office"], "/users"))

  section(:admin_menu, AdminMenuSection, AdminMenuSection::SELECTOR)

  element(:content, "#content")
  element(:invite_user, "a[href='/users/invitation/new']")

  sections :users, "table tbody tr" do
    element(:email, "td:nth-child(1)")
    element(:role, "td:nth-child(2)")
    element(:status, "td:nth-child(3)")
    element(:change_role, "li:nth-child(1) a")
    element(:deactivate, "li:nth-child(2) a")
  end

  def user_details(user_email)
    users.find { |user| user.email.text == user_email }
  end

  def change_user_role(user_email)
    selected_user = user_details(user_email)
    selected_user.change_role.click
  end

  def deactivate_user(user_email)
    selected_user = user_details(user_email)
    selected_user.deactivate.click
  end

  def look_for(user_email)
    # Look for the known email on page. If it's not there, click Next and look again.
    10.times do
      break if content.has_text?(user_email)

      find_link("Next ›").click
    end
  end

end
