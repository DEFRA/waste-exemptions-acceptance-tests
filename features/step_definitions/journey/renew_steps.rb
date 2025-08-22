# frozen_string_literal: true

When("I choose to renew a registration") do
  # Search for the most recent registration and start renewal:
  @renewer = "back office"
  @world.bo.dashboard_page.admin_menu.home_page.click
  @world.bo.dashboard_page.submit(search_term: @world.last_reg_no)
  find_link("Start renewal").click
  @world.journey.ad_privacy_policy_page.submit
  @renewal = true
end

When("I renew the registration {string} changes") do |changes|
  # Set a global @changes variable based on whether the renewal is with or without changes:
  @changes = changes.to_sym
  @renewal = true
  @world.journey.home_page.accept_cookies
  @world.journey.check_registered_company_name_page.submit(choice: :confirm) if company?
  # Check some details at the start of the renewal journey:
  expect(@world.journey.check_details_page.heading).to have_text("Are these details correct?")
  unless @changes == :without # make changes for the renewed registration
    @world.journey.check_details_page.change_contact_email.click
    @contact_email = "new@example.com"
    @world.journey.contact_email_page.submit(contact_email: @contact_email,
                                             confirmed_email: @contact_email)
    @world.journey.check_details_page.change_applicant_email.click
    @applicant_email = "new_applicant@example.com"
    @world.journey.email_page.submit(email: @applicant_email,
                                     confirm_email: @applicant_email)
    @world.journey.check_details_page.change_on_farm.click
    @world.journey.on_farm_page.submit
    @world.journey.check_details_page.change_farmer.click
    @world.journey.farmer_page.submit
    @world.journey.check_details_page.change_contact_address.click
    complete_address(:manual)
  end
  @world.journey.check_details_page.submit
  expect(@world.journey.renew_splash_page.heading).to have_text("You are about to renew for 3 years")
  @world.journey.renew_splash_page.submit
  @world.journey.declaration_page.submit
  expect(@world.journey.confirmation_page.confirmation_box).to have_text("You have renewed your exemptions for 3 years")
  @world.last_reg_no = @world.journey.confirmation_page.ref_no.text
  if @changes == :without
    puts "#{@world.last_reg_no} renewed with no changes. New registration is #{@world.last_reg_no}."
  else
    puts "#{@world.last_reg_no} renewed with changes. New registration is #{@world.last_reg_no}."
  end
end

# Front office steps:

Given("I receive an invitation to renew") do
  @renewer = "front office"
  @renewal = true
  # Log in initially as a back office user and send the renewal email.
  # This will only work in the test environment, where renewals are instantly available.
  login_user(@world.admin_team_user)
  @world.bo.dashboard_page.submit(search_term: @world.last_reg_no)
  @world.bo.dashboard_page.view_link(@world.last_reg_no)
  find_link("Resend renewal email").click
  expect(@world.bo.dashboard_page.dashboard_message).to have_text("Renewal email sent to #{@contact_email}")
end

Given("I click the link in the renewal email") do
  # Use the "last email" API to get the renewal link for the front office user
  visit(Quke::Quke.config.custom["urls"]["notify_link"])
  @renewal_url = @world.journey.last_message_page.get_renewal_url(@contact_email).to_s
  expect(@renewal_url).to have_text("/renew/")
  puts @renewal_url
  visit(@renewal_url)
end

Then("I receive a renewal confirmation email") do
  expected_text = [
    "Waste exemptions registration #{@world.last_reg_no} completed",
    "Registration complete"
  ]
  expect(email_exists?(expected_text)).to be true
end

Then("I cannot renew it again") do
  visit(@renewal_url)
  expect(@world.journey.confirmation_page.heading).to have_text("That registration has already been renewed")
end

Then("a renewal reminder letter has been sent") do
  expected_text = [
    "Renew your waste exemptions",
    "Registration details for registration number #{@world.last_reg_no}"
  ]
  expect(letter_exists?(expected_text)).to be true
end

When("I choose to remove all my exemptions") do
  @world.journey.home_page.accept_cookies
  @world.journey.check_registered_company_name_page.submit(choice: :confirm) if company?
  @world.journey.check_details_page.change_exemptions.click
  @world.journey.choose_exemptions_page.uncheck_all_exemptions_and_submit
end

When("I will be informed I need to select an exemption") do
  expect(@world.journey.choose_exemptions_page.error.text).to have_text("You must select at least one exemption")
end
