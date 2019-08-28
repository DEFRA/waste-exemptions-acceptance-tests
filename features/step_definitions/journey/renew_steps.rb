# frozen_string_literal: true

When("I search for a registration to renew") do
  # Search for the most recent registration and start renewal:
  @renewer = "back office"
  @world.bo.dashboard_page.submit(search_term: @world.last_reg_no)
  find_link("Start renewal").click
  @world.journey.ad_privacy_policy_page.continue_button.click
end

When("I renew the registration {string} changes") do |changes|
  # Set a global @changes variable based on whether the renewal is "with" or "without" changes:
  @changes = changes

  # Check some details at the start of the renewal journey:
  expect(@world.journey.renew_choice_page.heading).to have_text("Do you want to renew with these details?")
  content = @world.journey.renew_choice_page.content
  expect(content).to have_text("U12 - Using mulch")
  expect(content).to have_text("the company name is " + @world.last_reg[:operator_name])
  expect(content).to have_text("the Companies House number is " + @world.last_reg[:registration_number])
  expect(content).to have_text("your name is " + @world.last_reg[:applicant][:full_name].to_s)

  if @changes == "without"
    @world.journey.renew_choice_page.renew_without_changes_radio.click
    @world.journey.renew_choice_page.continue_button.click
    # rubocop:disable Metrics/LineLength
    expect(@world.journey.renew_splash_page.heading).to have_text("You are about to renew for 3 years with the current details")
    # rubocop:enable Metrics/LineLength
    @world.journey.renew_splash_page.continue_button.click
    @world.journey.declaration_page.submit
    # rubocop:disable Metrics/LineLength
    expect(@world.journey.confirmation_page.confirmation_box).to have_text("You have renewed your exemptions for 3 years")
    # rubocop:enable Metrics/LineLength

    @renewed_reg = @world.last_reg # renewed registration has same details as before
    @renewed_reg_no = @world.journey.confirmation_page.ref_no.text
    puts @world.last_reg_no + " renewed with no changes. New registration is " + @renewed_reg_no + "."

  else # make changes for the renewed registration

    # Generate data to use for the new registration:
    @renewed_reg = generate_registration(:individual, nil)

    @world.journey.renew_choice_page.renew_with_changes_radio.click
    @world.journey.renew_choice_page.continue_button.click

    # rubocop:disable Metrics/LineLength
    expect(@world.journey.renew_splash_page.heading).to have_text("We'll fill in the form with your current registration details")
    # rubocop:enable Metrics/LineLength
    @world.journey.renew_splash_page.continue_button.click
    @world.journey.location_page.submit(location: :england)

    # Replace the U12 exemption with an S3 by clicking both:
    @world.journey.choose_exemptions_page.submit(exemptions: %w[U12 S3])
    @renewed_reg[:exemptions] = %w[U2 T6 T19 T25 T31 S1 S3]

    # Check applicant's name is prepopulated from the ORIGINAL registration, then complete new applicant details:
    expect(@world.journey.applicant_name_page.first_name.value).to eq(@world.last_reg[:applicant][:first_name])
    expect(@world.journey.applicant_name_page.last_name.value).to eq(@world.last_reg[:applicant][:last_name])
    complete_applicant_details(@renewed_reg[:applicant])

    complete_organisation_details(@renewed_reg, "random")

    # Check applicant's name is prepopulated from the ORIGINAL registration, then complete new applicant details:
    expect(@world.journey.contact_name_page.first_name.value).to eq(@world.last_reg[:contact][:first_name])
    expect(@world.journey.contact_name_page.last_name.value).to eq(@world.last_reg[:contact][:last_name])
    complete_contact_details(@renewed_reg[:contact], "random")

    complete_farm_questions(@renewed_reg)

    # Populate grid reference or address, based on the original site type:
    heading = @world.journey.site_grid_reference_page.heading.text
    if heading == "Where will this waste operation take place?"
      @world.journey.site_grid_reference_page.submit(
        grid_ref: @renewed_reg[:site][:grid_ref],
        site_details: @renewed_reg[:site][:site_details]
      )
    elsif heading == "What's the postcode of the waste operation?"
      complete_address("lookup")
    else
      puts "Error - can't work out what type of address the original registration is"
    end

    complete_confirmations
    expect(@world.journey.confirmation_page.confirmation_box).to have_text("You have renewed your exemptions")
    @renewed_reg_no = @world.journey.confirmation_page.ref_no.text
    puts @world.last_reg_no + " renewed with changes. New registration is " + @renewed_reg_no + "."

  end

end

Then("I can see the correct renewed details") do
  # Search for the renewed registration in back office.
  # Should already be logged in as a back office user:
  visit(Quke::Quke.config.custom["urls"]["back_office"])
  @world.bo.dashboard_page.submit(search_term: @renewed_reg_no)
  find_link("View details").click
  @world.bo.registration_details_page.reporting_info_link.click

  # Check that the page contains information from the renewed registration:
  content = @world.bo.registration_details_page.content
  expect(content).to have_text("U12 — Using mulch") if @changes == "without"
  expect(content).to have_text("S3 — Storing sludge") if @changes == "with"
  expect(content).to have_text(@renewed_reg[:operator_name])
  expect(content).to have_text(@renewed_reg[:registration_number]) if @changes == "without"
  expect(content).to have_no_text(@world.last_reg[:registration_number]) if @changes == "with"
  expect(content).to have_text(@renewed_reg[:applicant][:last_name].to_s)
  expect(content).to have_text(@renewed_reg[:applicant][:email].to_s)
  expect(content).to have_text(@renewed_reg[:contact][:last_name].to_s)
  expect(content).to have_text(@renewed_reg[:contact][:email].to_s)
end

When("I partially renew the registration") do
  @world.journey.renew_choice_page.renew_with_changes_radio.click
  @world.journey.renew_choice_page.continue_button.click
  @world.journey.renew_splash_page.continue_button.click
  @world.journey.location_page.submit(location: :england)
  # Add an S3 exemption
  @world.journey.choose_exemptions_page.submit(exemptions: %w[S3])
end

Then("I can renew it again") do
  # The intended behaviour is actually for back office NOT to be able to renew a registration here.
  # This will be fixed in RUBY-602.
  find_link("Dashboard").click
  @world.bo.dashboard_page.submit(search_term: @world.last_reg_no)
  find_link("Start renewal").click
  @world.journey.ad_privacy_policy_page.continue_button.click
  expect(@world.journey.renew_choice_page.heading).to have_text("Do you want to renew with these details?")
end

Then("I can resume the renewal from where I left off") do

  if @renewer == "back office"
    find_link("Dashboard").click
    @world.bo.dashboard_page.submit(search_term: @world.last_reg_no)
    find_link("Start renewal").click
    @world.journey.ad_privacy_policy_page.continue_button.click

  elsif @renewer == "front office"
    # Use the "last email" API to get the renewal link for the front office user
    visit(Quke::Quke.config.custom["urls"]["back_office_email"])
    renewal_url = @world.email.last_email_api_page.get_renewal_url(@renewer_email).to_s
    expect(renewal_url).to have_text("/renew/")
    visit(renewal_url)
  end

  expect(@world.journey.applicant_name_page.heading).to have_text("Who is filling in this form?")
end

# Front office steps:

Given("I receive an invitation to renew") do
  @renewer = "front office"
  @renewer_email = @world.last_reg[:contact][:email].to_s

  # Log in initially as a back office user and send the renewal email.
  # This will only work in the test environment, where renewals are instantly available.
  login_user(@world.super_agent_user)
  @world.bo.dashboard_page.submit(search_term: @world.last_reg_no)
  find_link("Resend renewal email").click
  expect(@world.bo.dashboard_page.renewal_email_confirmation).to have_text("Renewal email sent to " + @renewer_email)
end

Given("I click the link in the renewal email") do
  # Use the "last email" API to get the renewal link for the front office user
  visit(Quke::Quke.config.custom["urls"]["back_office_email"])
  renewal_url = @world.email.last_email_api_page.get_renewal_url(@renewer_email).to_s
  expect(renewal_url).to have_text("/renew/")
  visit(renewal_url)
end

Then("I receive a renewal confirmation email") do
  visit(Quke::Quke.config.custom["urls"]["front_office_email"])
  # We don't know whether the applicant or contact email will be sent first,
  # so we need to check both. If the applicant email doesn't work, try the contact email.
  email_recipient = "applicant"
  # rubocop:disable Metrics/LineLength
  confirmation_email = @world.email.last_email_api_page.get_confirmation_email(@renewed_reg[:applicant][:email].to_s, @renewed_reg_no)
  # rubocop:enable Metrics/LineLength
  if confirmation_email == "nope"
    email_recipient = "contact"
    # rubocop:disable Metrics/LineLength
    confirmation_email = @world.email.last_email_api_page.get_confirmation_email(@renewed_reg[:contact][:email].to_s, @renewed_reg_no)
    # rubocop:enable Metrics/LineLength
  end
  # Check either the applicant or contact's email address depending on what's been retrieved in the last email:
  expect(confirmation_email).to have_text(@renewed_reg[email_recipient.to_sym][:email].to_s)
  expect(confirmation_email).to have_text("Waste exemptions registration " + @renewed_reg_no + " completed")
  expect(confirmation_email).to have_text("Registration complete")
  expect(confirmation_email).to have_text(@renewed_reg_no)
end

Then("I cannot renew it again from the front office") do
  expect(@world.journey.renew_choice_page.heading).to have_text("That registration has already been renewed")
end

Then("I cannot renew it again from the back office") do
  # Back office user should already be logged in from previous scenarios. Access back office page
  visit(Quke::Quke.config.custom["urls"]["back_office"])
  @world.bo.dashboard_page.submit(search_term: @world.last_reg_no)
  expect(@world.bo.dashboard_page.results[0]).to have_text("Already renewed")
  expect(@world.bo.dashboard_page.results[0]).to have_no_text("Start renewal")
  expect(@world.bo.dashboard_page.results[0]).to have_no_text("Resend renewal email")
  find_link("View details").click
  expect(@world.bo.registration_details_page.action_box).to have_text("Already renewed")
  expect(@world.bo.registration_details_page.action_box).to have_no_text("Start renewal")
  expect(@world.bo.registration_details_page.action_box).to have_no_text("Resend renewal email")
end
