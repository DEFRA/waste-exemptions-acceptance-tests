# frozen_string_literal: true

When("I choose to deregister exemptions from the email invite") do
  visit("http://localhost:3000/renew/6TmTQXbH3KmsUQbFx1ak13gn")
  #   visit(Quke::Quke.config.custom["urls"]["notify_link"])
  #   @renewal_url = @world.journey.last_message_page.get_renewal_url(@renewer_email).to_s
  #   expect(@renewal_url).to have_text("/renew/")
  #   puts @renewal_url
  #   visit(@renewal_url)

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
