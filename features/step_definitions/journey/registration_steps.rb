# frozen_string_literal: true

# Use Ruby regex here rather than Cucumber (eg {string}), as regex types can't be mixed:
Given(/^my business is (?:a|an) "([^"]*)"$/) do |business|
  @world.last_reg = generate_registration(business.to_sym)
end

Then("I start a new waste exemption registration") do
  @world.journey.home_page.load
  @world.journey.registration_type_page.submit(start_option: :new_radio)
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

Given("I am on the check contact phone page") do
  @world.journey.location_page.submit(location: :england)
  # Add an S3 exemption
  @world.journey.choose_exemptions_page.submit(exemptions: %w[S3])
  @applicant = generate_person("applicant@example.com")
  complete_applicant_details(@applicant)
  @world.journey.business_type_page.submit(business_type: :individual)
  @world.journey.operator_name_page.submit(org_name: "Soul trader")
  complete_address("lookup")
  @world.journey.name_page.submit(first_name: @applicant[:first_name], last_name: @applicant[:last_name])
  @world.journey.contact_position_page.submit
  expect(@world.journey.check_contact_phone_page.phone_number.text).to eq @applicant[:telephone]
end

Given("I am on the check contact email page") do
  @world.journey.location_page.submit(location: :england)
  # Add an S3 exemption
  @world.journey.choose_exemptions_page.submit(exemptions: %w[S3])
  @applicant = generate_person("applicant@example.com")
  complete_applicant_details(@applicant)
  @world.journey.business_type_page.submit(business_type: :individual)
  @world.journey.operator_name_page.submit(org_name: "Soul trader")
  complete_address("lookup")
  @world.journey.name_page.submit(first_name: @applicant[:first_name], last_name: @applicant[:last_name])
  @world.journey.contact_position_page.submit
  @world.journey.check_contact_phone_page.submit(reuse: :accept)
  expect(@world.journey.check_contact_email_page.email.text).to eq @applicant[:email]
end

Then("I will be informed the registration is complete") do
  expect(page).to have_content "You have registered your exemptions for 3 years"
  @world.last_reg_no = @world.journey.confirmation_page.ref_no.text
  puts "Registration #{@world.last_reg_no} completed"
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

When("I carry out a partial registration") do
  # Generate and submit an incomplete registration and record the applicant's name, for later searching:
  unsubmitted_reg = generate_registration(:individual)
  add_unsubmitted_registration(unsubmitted_reg)
  @last_transient_name = unsubmitted_reg[:applicant][:full_name].to_s
  puts "Partial registration completed by " + @last_transient_name
end

When("I choose to use this telephone number as a contact number") do
  @world.journey.check_contact_phone_page.submit(reuse: :accept)
end

When("I choose to use this email address as a contact email address") do
  @world.journey.check_contact_email_page.submit(reuse: :accept)
end

Then("I will be on the contact check email page") do
  expect(@world.journey.check_contact_email_page.title).to have_text("Do you want to use this email")
end

Then("I will be on the contact check address page") do
  # expect(@world.journey.check_contact_email_page.title).to have_text("Do you want to use this address")
  expect(@world.journey.check_contact_email_page.title).to have_text("What's their postcode?")
end

Then("I can access the footer links") do
  @world.journey.home_page.privacy_footer.click
  expect(page).to have_text("Privacy Notice: how we use your personal data")
  @world.journey.home_page.cookies_footer.click
  expect(page).to have_text("Cookie settings")
  @world.journey.home_page.accessibility_footer.click
  expect(page).to have_text("Accessibility statement")

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
