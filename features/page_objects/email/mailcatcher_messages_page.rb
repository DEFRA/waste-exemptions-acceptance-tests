# frozen_string_literal: true

class MailcatcherMessagesPage < SitePrism::Page

  element(:confirmation_link, "#confirmation_link")
  element(:trash, "button[title='Delete Emails']")
  element(:accept_invite, "a[href*='/users/invitation']")
end
