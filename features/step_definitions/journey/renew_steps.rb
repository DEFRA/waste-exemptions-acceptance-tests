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
  expect(@world.journey.renew_choice_page.heading).to have_text("Do you want to renew with these details?")
  expect(page).to have_text("U1")
  unless @changes == :without # make changes for the renewed registration

    # @world.journey.check_details_page.change_contact_email.click
    # @contact_email = "new_contact@example.com"
    # @world.journey.contact_email_page.submit(contact_email: @contact_email,
    #                                        confirmed_email: @contact_email)
    @world.journey.check_details_page.change_applicant_email.click
    @applicant_email = "new_applicant@example.com"
    @world.journey.email_page.submit(email: @applicant_email,
                                     confirm_email: @applicant_email)

  end
  @world.journey.renew_choice_page.renew_without_changes_radio.click
  @world.journey.renew_choice_page.submit
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

When("I renew changing my organisation type") do
  @world.journey.home_page.accept_cookies
  @world.journey.check_registered_company_name_page.submit(choice: :confirm) if company?
  @renewed_reg = generate_registration(@business_type, nil)

  @world.journey.renew_choice_page.renew_with_changes_radio.click
  @world.journey.renew_choice_page.submit

  # rubocop:disable Layout/LineLength
  expect(@world.journey.renew_splash_page.heading).to have_text("We'll fill in the form with your current registration details")
  # rubocop:enable Layout/LineLength
  @world.journey.renew_splash_page.submit
  @world.journey.location_page.submit(location: :england)
  @world.journey.choose_exemptions_page.submit
  complete_applicant_details(@renewed_reg[:applicant])

  @world.journey.business_type_page.submit(business_type: :individual)
end

When("I am asked to confirm the exemptions I still require during renewal") do
  @world.journey.home_page.accept_cookies
  @world.journey.check_registered_company_name_page.submit(choice: :confirm) if company?
  @renewed_reg = generate_registration(@business_type, nil)

  @world.journey.renew_choice_page.renew_with_changes_radio.click
  @world.journey.renew_choice_page.submit

  # rubocop:disable Layout/LineLength
  expect(@world.journey.renew_splash_page.heading).to have_text("We'll fill in the form with your current registration details")
  # rubocop:enable Layout/LineLength
  @world.journey.renew_splash_page.submit
  @world.journey.location_page.submit(location: :england)
end

Then("I can renew it again") do
  # The intended behaviour is actually for back office NOT to be able to renew a registration here.
  # This will be fixed in RUBY-602.
  find_link("Dashboard").click
  @world.bo.dashboard_page.submit(search_term: @world.last_reg_no)
  find_link("Start renewal").click
  @world.journey.ad_privacy_policy_page.submit
  expect(@world.journey.renew_choice_page.heading).to have_text("Do you want to renew with these details?")
end

# Front office steps:

Given("I receive an invitation to renew") do
  @renewer = "front office"
  @renewal = true
  # Log in initially as a back office user and send the renewal email.
  # This will only work in the test environment, where renewals are instantly available.
  login_user(@world.super_agent_user)
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
  expect(@world.journey.renew_choice_page.heading).to have_text("That registration has already been renewed")
end

Then("a renewal reminder letter has been sent") do
  expected_text = [
    "Renew your waste exemptions",
    "Registration details for registration number #{@world.last_reg_no}"
  ]
  expect(letter_exists?(expected_text)).to be true
end

Then("I am informed I will need a new registration") do
  expect(@world.journey.can_not_renew_type_page.heading).to have_text("You need a new registration")
  expect(@world.journey.can_not_renew_type_page).to have_new_registration_option
end

When("I choose to remove all my exemptions") do
  @world.journey.choose_exemptions_page.uncheck_all_exemptions_and_submit
end

When("I will be informed I do not need to renew") do
  expect(@world.journey.renew_no_exemptions_page.heading).to have_text("You are about to remove all exemptions")
end
