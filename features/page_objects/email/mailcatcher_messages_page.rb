class MailcatcherMessagesPage < SitePrism::Page

  element(:confirmation_link, "#confirmation_link")
  element(:trash, "button[title='Delete Emails']")
  element(:accept_invite, "a[href*='users/invitation/accept']")
end
