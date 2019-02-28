Then(/^I will receive a confirmation email$/) do
  if @email_app.local?
    @email_app.mailcatcher_main_page.load
    @email_app.mailcatcher_main_page.open_email(1)
    expect(@email_app.mailcatcher_messages_page).to have_text "Registration complete"
  else
    @email_app.mailinator_page.load
    @email_app.mailinator_page.submit(inbox: @email_address)
    @email_app.mailinator_inbox_page.wait_for_email
    expect(@email_app.mailinator_inbox_page).to have_text "complete"
  end
end
