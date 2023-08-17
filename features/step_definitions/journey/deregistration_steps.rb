# frozen_string_literal: true

When("I choose to deregister exemptions from the email invite") do
  @world.bo.dashboard_page.admin_menu.home_page.click
  @world.bo.dashboard_page.submit(search_term: @registration)
  @world.bo.dashboard_page.view_reg_details_links.first.click
  @world.bo.registration_details_page.deregister_invite_action.click
  @world.bo.dashboard_page.admin_menu.home_page.click
  @world.bo.dashboard_page.sign_out_button.click
  visit(Quke::Quke.config.custom["urls"]["notify_link"])
  @dereg_url = @world.journey.last_message_page.dereg_url.to_s
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

When("I confirm to deregister all my exemptions") do
  expect(@world.journey.confirm_edit_exemptions_page.heading).to have_text("deregister all of these exemptions")
  @world.journey.confirm_edit_exemptions_page.submit(deregister: :accept)
end

When("I complete the declaration") do
  @world.journey.declaration_page.submit
end

When("I confirm to deregister an exemption") do
  expect(@world.journey.confirm_edit_exemptions_page.heading).to have_text("remove these exemptions?")
  @world.journey.confirm_edit_exemptions_page.submit(deregister: :accept)
  @world.journey.declaration_page.submit
end

Then("I will see confirmation that my registration has be deregistered") do
  expect(@world.journey.confirmation_page.heading).to have_text("Your registration is inactive")
end

Then("I will see confirmation that my exemption has be deregistered") do
  # expect(@world.journey.confirmation_page.heading).to have_text("You have removed")
  expect(@world.journey.confirmation_page).to have_text("You have removed")
end

Then("I will receive a deregistration confirmation email") do
  expected_text = [
    "Your registration #{@registration} is now inactive",
    "Deregistration complete"
  ]
  expect(email_exists?(@world.last_reg, expected_text)).to be true
end

Then("I will receive a registration edit confirmation email") do
  expected_text = [
    "The registration number is #{@registration}",
    "Registration edit complete"
  ]
  expect(email_exists?(@world.last_reg, expected_text)).to be true
end

Then("I can not send a deregistration invite email") do
  @world.bo.dashboard_page.admin_menu.home_page.click
  @world.bo.dashboard_page.submit(search_term: @registration)
  @world.bo.dashboard_page.view_reg_details_links.first.click
  expect(@world.bo.registration_details_page).to have_no_deregister_invite_action
end

Then("I choose to edit a registration") do
  @world.journey.home_page.load
  @world.journey.registration_type_page.submit(start_option: :edit_registration)
end

Then("I edit my registration using the self serve option") do
  @world.journey.home_page.load
  @world.journey.registration_type_page.submit(start_option: :edit_registration)
  @world.journey.waste_exemption_number_page.submit(registration_number: @registration)
  @world.journey.waste_exemption_email_address_page.submit(email: "contact1@example.com")
  visit(Quke::Quke.config.custom["urls"]["notify_link"])
  @edit_url = @world.journey.last_message_page.edit_url.to_s
  expect(@edit_url).to have_text("/edit_registration/")
  puts @edit_url
  visit(@edit_url)
end

Then("I enter my registration number") do
  @world.journey.waste_exemption_number_page.submit(registration_number: @registration)
end

Then("I enter an email used in the registration") do
  @world.journey.waste_exemption_email_address_page.submit(email: "contact1@example.com")
end

When("I select the option to edit details") do
  @world.journey.registration_type_page.submit(start_option: :edit_registration)
end

When("I edit my waste exemptions") do
  @world.journey.edit_page.edit_exemptions.click
end
