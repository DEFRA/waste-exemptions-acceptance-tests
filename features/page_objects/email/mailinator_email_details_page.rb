class MailinatorEmailDetailsPage < SitePrism::Page
  # Mailinator email details page
  element(:confirm_email, "#confirmation_link")
  element(:accept_invite, "a[href*='mailinator']")
end
