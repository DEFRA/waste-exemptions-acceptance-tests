# frozen_string_literal: true

When("I choose to deregister exemptions from the email invite") do
  @world.bo.dashboard_page.admin_menu.home_page.click
  @world.bo.dashboard_page.submit(search_term: @registration)
  @world.bo.dashboard_page.view_reg_details_links.first.click
  @world.bo.registration_details_page.deregister_invite_action.click
  visit(Quke::Quke.config.custom["urls"]["notify_link"])
  @dereg_url = @world.journey.last_message_page.dereg_url.to_s
  expect(@dereg_url).to have_text("/edit_registration/")
  puts @dereg_url
  visit(@dereg_url)
end

When("I choose to deregister all current exemptions") do
  @world.journey.choose_exemptions_page.accept_cookies
  @world.journey.choose_exemptions_page.uncheck_all_exemptions_and_submit
end

When("I choose to deregister an exemption") do
  @world.journey.choose_exemptions_page.accept_cookies
  @world.journey.choose_exemptions_page.exemptions.first.click
  @world.journey.choose_exemptions_page.submit_button.click
end

Then("I will receive a deregistration confirmation email") do
  expected_text =
    "Your registration #{@registration} is now inactive"
  visit(Quke::Quke.config.custom["urls"]["notify_link"])
  expect(@world.journey.last_message_page).to have_text(expected_text)
  expect(@world.journey.last_message_page).to have_text(@contact_email)

end
