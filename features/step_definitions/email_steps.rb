# frozen_string_literal: true

Then(/^I will receive a confirmation email$/) do
  if @world.email.local?
    @world.email.mailcatcher_main_page.load
    @world.email.mailcatcher_main_page.open_email(1)
    expect(@world.email.mailcatcher_messages_page).to have_text "Registration complete"
  else
    @world.email.mailinator_page.load
    @world.email.mailinator_page.submit(inbox: @email_address)
    expect(@world.email.mailinator_inbox_page).to have_text "complete"
  end
end
