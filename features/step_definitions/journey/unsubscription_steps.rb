# frozen_string_literal: true

Given("I choose to unsubscribe from renewal reminders") do
  # Use the "last email" API to get the renewal link for the front office user
  visit(Quke::Quke.config.custom["urls"]["notify_link"])
  @unsubscribe_link = @world.journey.last_message_page.get_unsubscribe_url(@contact_email).to_s
  expect(@unsubscribe_link).to have_text("/unsubscribe/")
  puts @unsubscribe_link
  visit(@unsubscribe_link)
end

Then("I will see confirmation that I have unsubscibed") do
  expect(@world.journey.unsubscription_confirmation_page)
    .to have_text("You have successfully unsubscribed from renewal reminder emails.")
  @message_template = "User unsubscribed from renewal reminders"
end

Then("the unsubscription is logged in the communications history") do
  login_user(@world.admin_team_user)
  visit(back_office_root_url("/registrations/#{@world.last_reg_no}/communication_logs"))

  log = @world.bo.communication_history_page.log_details(@message_template)
  log.template_title.click
  expect(@world.bo.communication_log_page.template_title).to have_text(@message_template)
end
