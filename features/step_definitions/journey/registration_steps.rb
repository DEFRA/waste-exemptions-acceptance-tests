# frozen_string_literal: true

# Use Ruby regex here rather than Cucumber (eg {string}), as regex types can't be mixed:
Given(/^my business is (?:a|an) "([^"]*)"$/) do |business|
  @world.last_reg = generate_registration(business.to_sym)
end

Then("I register an exemption") do
  # Set app to front office, to determine which email service to call later
  @app = :fo
  # Complete the registration. See registration_helpers for an explanation of the parameters.
  # Registration details are stored as a hash, @world.last_reg.
  # Registration number is stored as a string, @world.last_reg_no.
  @world.last_reg_no = add_submitted_registration(@world.last_reg, true, "random", "random")
end

Given("a registration has been created") do
  @world.last_reg = generate_registration(:limited_company)
  @world.last_reg_no = add_submitted_registration(@world.last_reg, true, "random", "random")
end

Then("I will be informed the registration is complete") do
  expect(page).to have_content "Registration complete"
  @world.last_reg_no = @world.journey.confirmation_page.ref_no.text
end

Then("I will receive a registration confirmation email") do
  expected_text = [
    "Waste exemptions registration " + @world.last_reg_no + " completed",
    "Download your confirmation",
    "causing a nuisance through noise and odours"
  ]
  expect(email_exists?(@world.last_reg, expected_text)).to be true
end

Then("a registration confirmation letter has been sent") do
  expected_text = [
    "Your reference: " + @world.last_reg_no
  ]
  expect(letter_exists?(expected_text)).to be true
end

Then(/^I complete (?:a|an) "([^"]*)" registration$/) do |business|
  @world.bo.dashboard_page.create_new_registration.click
  # Click through the links on the privacy policy page:
  @world.journey.ad_privacy_policy_page.policy_text_link.click
  @world.journey.ad_privacy_policy_page.dpo_details_link.click
  @world.journey.ad_privacy_policy_page.ico_details_link.click
  expect(@world.journey.ad_privacy_policy_page.content).to have_text("European Economic Area")
  @world.journey.ad_privacy_policy_page.submit_button.click
  @world.last_reg = generate_registration(business.to_sym)

  # This also stores the exemption number so the exemption can be edited in later steps.
  @world.last_reg_no = add_submitted_registration(@world.last_reg, false, "random", "random")
end

Then(/^I complete (?:a|an) assisted digital "([^"]*)" registration$/) do |business|
  @world.bo.dashboard_page.create_new_registration.click
  @world.journey.ad_privacy_policy_page.submit_button.click
  @world.last_reg = generate_registration(business.to_sym, email: "waste-exemptions@environment-agency.gov.uk")

  # This also stores the exemption number so the exemption can be edited in later steps.
  @world.last_reg_no = add_submitted_registration(@world.last_reg, false, "random", "random")
end

When("I carry out a partial registration") do
  # Generate and submit an incomplete registration and record the applicant's name, for later searching:
  unsubmitted_reg = generate_registration(:individual)
  add_unsubmitted_registration(unsubmitted_reg)
  @last_transient_name = unsubmitted_reg[:applicant][:full_name].to_s
  puts "Partial registration completed by " + @last_transient_name
end

Then("I complete an in progress registration") do
  find_link("Waste exemptions back office").click
  # Add a sleep here, because the automated tests often have a problem with the filter steps:
  sleep(1)
  @world.bo.dashboard_page.unsubmitted_filter.click
  @world.bo.dashboard_page.submit(search_term: @last_transient_name)

  # Check first that I can view details for an in progress registration (RUBY-329)
  @world.bo.dashboard_page.view_transient_details_links[0].click
  expect(@world.bo.registration_details_page.heading).to have_text("In-progress registration details")
  @world.bo.registration_details_page.back_link.click

  # Start the resume process
  @world.bo.dashboard_page.unsubmitted_filter.click
  @world.bo.dashboard_page.submit(search_term: @last_transient_name)
  @world.bo.dashboard_page.resume_links[0].click
  expect(page).to have_content("Who should we contact about this waste exemption operation?")

  # Generate the data for the rest of the registration and save it as a world variable:
  @world.reg_to_complete = generate_registration(:individual)

  # Complete the registration and store the registration number.
  @world.completed_reg = continue_unsubmitted_registration(@world.reg_to_complete, "random", "random")
end

Then("I can find and edit the registration I just submitted") do
  # Search for the registration I just completed:
  @world.bo.registration_complete_page.home_link.click
  @world.bo.dashboard_page.submitted_filter.click
  @world.bo.dashboard_page.submit(search_term: @world.completed_reg)
  expect(@world.bo.dashboard_page).to have_results
  expect(page).to have_content(@world.reg_to_complete[:applicant][:first_name].to_s)

  # Edit the applicant's name so that it doesn't appear in the submitted search results
  find_link("Edit").click
  expect(@world.bo.edit_page.heading).to have_text("Edit " + @world.completed_reg + " registration")
  @world.bo.edit_page.change_operator_link.click
  @world.bo.edit_details_page.submit(
    operator_name: "Miss Waste Completed"
  )
  @world.bo.edit_page.submit_button.click
  @world.journey.declaration_page.submit
  expect(@world.bo.edit_details_page.heading).to have_text("Edit complete")
  @world.bo.edit_details_page.submit_button.click
end

Then("I can access the footer links") do
  new_window = window_opened_by { find_link("Privacy").click }
  within_window new_window do
    expect(page).to have_text("Privacy Policy: how we use your personal information")
    new_window = window_opened_by { find_link("Cookies").click }
    within_window new_window do
      expect(page).to have_text("Cookies")
      new_window = window_opened_by { find_link("Accessibility").click }
      within_window new_window do
        expect(page).to have_text("Accessibility statement")
      end
    end
  end
end

Given("I am on the service") do
  @world.journey.home_page.load
end

When("I select the option to change details") do
  @world.journey.registration_type_page.submit(start_option: :change_registration)
end

Then("I will be advised to contact the EA") do
  expect(page).to have_text("Contact the Environment Agency")
  expect(page).to have_text("You'll need to contact the Environment Agency")
end
