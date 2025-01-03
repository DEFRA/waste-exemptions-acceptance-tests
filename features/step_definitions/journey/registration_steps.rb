# frozen_string_literal: true

# Use Ruby regex here rather than Cucumber (eg {string}), as regex types can't be mixed:
Given(/^my business is (?:a|an) "([^"]*)"$/) do |business|
  @business_type = business.to_sym
  @world.last_reg = generate_registration(business.to_sym)
end

Then("I start a new waste exemption registration") do
  @world.journey.home_page.load
  @world.journey.home_page.accept_cookies
  @world.journey.registration_type_page.submit(start_option: :new_radio)
end

Then("I register an exemption") do
  # Set app to front office, to determine which email service to call later
  @app = :fo
  # Complete the registration. See registration_helpers for an explanation of the parameters.
  # Registration details are stored as a hash, @world.last_reg.
  # Registration number is stored as a string, @world.last_reg_no.
  @world.last_reg_no = add_submitted_registration(@world.last_reg, :random, :random)
end

Given("I register choosing to reuse my business information previously entered") do
  @world.journey.location_page.submit(location: :england)
  # Add an S3 exemption
  @world.journey.choose_exemptions_page.submit(exemptions: %w[S3])
  @applicant = generate_person("applicant@example.com")
  complete_applicant_details(@applicant)
  complete_organisation_details(@world.last_reg)
  complete_address(:lookup)
  @world.journey.check_contact_name_page.submit(reuse: :accept)
  @world.journey.contact_position_page.submit(position: @applicant[:position])
  @world.journey.check_contact_phone_page.submit(reuse: :accept)
  @world.journey.check_contact_email_page.submit(reuse: :accept)
  @world.journey.check_contact_address_page.submit(reuse: :accept)
  @world.journey.on_farm_page.submit
  @world.journey.farmer_page.submit
  @world.journey.site_grid_reference_page.choose_address.click
  @world.journey.check_site_address_page.submit(choice: :operator_address_reuse)
end

Given("I register choosing different business and contact addresses") do
  @world.journey.location_page.submit(location: :england)
  # Add an S3 exemption
  @world.journey.choose_exemptions_page.submit(exemptions: %w[S3])
  @applicant = generate_person("applicant@example.com")
  complete_applicant_details(@applicant)
  @world.journey.business_type_page.submit(business_type: :individual)
  @world.journey.operator_name_page.submit(org_name: "Soul trader")
  @postcode = "BS1 5AH"
  @business_address = "ENVIRONMENT AGENCY, HORIZON HOUSE, DEANERY ROAD, BRISTOL, BS1 5AH"
  @world.journey.address_lookup_page.submit(postcode: @postcode, result: @business_address)
  @world.journey.check_contact_name_page.submit(reuse: :reject)
  @world.journey.name_page.submit(first_name: @applicant[:first_name], last_name: @applicant[:last_name])
  @world.journey.contact_position_page.submit(position: @applicant[:position])
  @world.journey.check_contact_phone_page.submit(reuse: :accept)
  @world.journey.check_contact_email_page.submit(reuse: :accept)
  @world.journey.check_contact_address_page.submit(reuse: :reject)
  @postcode = "S9 4WF"
  @contact_address = "ENVIRONMENT AGENCY, QUADRANT 2, 99, PARKWAY AVENUE, SHEFFIELD, S9 4WF"
  @world.journey.address_lookup_page.submit(postcode: @postcode, result: @contact_address)
  @world.journey.on_farm_page.submit(on_farm: :on_farm)
  @world.journey.farmer_page.submit(farmer: :farmer)
  @world.journey.site_grid_reference_page.choose_address.click
end

Given("I register choosing different business and contact addresses and a site grid reference") do
  @world.journey.location_page.submit(location: :england)
  # Add an S3 exemption
  @world.journey.choose_exemptions_page.submit(exemptions: %w[S3])
  @applicant = generate_person("applicant@example.com")
  complete_applicant_details(@applicant)
  @world.journey.business_type_page.submit(business_type: :individual)
  @world.journey.operator_name_page.submit(org_name: "Soul trader")
  @postcode = "BS1 5AH"
  @business_address = "ENVIRONMENT AGENCY, HORIZON HOUSE, DEANERY ROAD, BRISTOL, BS1 5AH"
  @world.journey.address_lookup_page.submit(postcode: @postcode, result: @business_address)
  @world.journey.check_contact_name_page.submit(reuse: :reject)
  @world.journey.name_page.submit(first_name: @applicant[:first_name], last_name: @applicant[:last_name])
  @world.journey.contact_position_page.submit(position: @applicant[:position])
  @world.journey.check_contact_phone_page.submit(reuse: :accept)
  @world.journey.check_contact_email_page.submit(reuse: :accept)
  @world.journey.check_contact_address_page.submit(reuse: :reject)
  @postcode = "S9 4WF"
  @contact_address = "ENVIRONMENT AGENCY, QUADRANT 2, 99, PARKWAY AVENUE, SHEFFIELD, S9 4WF"
  @world.journey.address_lookup_page.submit(postcode: @postcode, result: @contact_address)
  @world.journey.on_farm_page.submit(on_farm: :on_farm)
  @world.journey.farmer_page.submit(farmer: :farmer)
  @ngr = "ST 58132 72695"
  @site_description = "wrong site location"
  @world.journey.site_grid_reference_page.submit(
    grid_ref: @ngr,
    site_details: @site_description
  )
end

Then("I will be informed the registration is complete") do
  expect(page).to have_content "your exemptions for 3 years"
  @world.last_reg_no = @world.journey.confirmation_page.ref_no.text
  puts "Registration #{@world.last_reg_no} completed"
end

Then("I will receive a registration confirmation email") do
  expected_text = [
    "Waste exemptions registration #{@world.last_reg_no} completed",
    "Download your confirmation",
    "causing a nuisance through noise and odours"
  ]
  expect(email_exists?(expected_text, @world.last_reg)).to be true
end

Then("I am on the check your answers page") do
  @world.journey.check_registered_company_name_page.submit(choice: :confirm) if company? && @renewal
  if @renewal
    expect(@world.journey.check_details_page.title).to have_text("Do you want to renew with these details?")
  else
    expect(@world.journey.check_details_page.title).to have_text("Check your answers")
  end

  puts @world.journey.check_details_page.current_url
end

Then("I am on the check site address page") do
  puts current_url
  expect(@world.journey.check_details_page.title).to have_text("Where will the waste operation take place?")
end

Then("a registration confirmation letter has been sent") do
  expected_text = [
    "Your reference: #{@world.last_reg_no}"
  ]
  expect(letter_exists?(expected_text)).to be true
end

When("I carry out a partial registration") do
  # Generate and submit an incomplete registration and record the applicant's name, for later searching:
  unsubmitted_reg = generate_registration(:individual)
  add_unsubmitted_registration(unsubmitted_reg)
  @last_transient_name = unsubmitted_reg[:applicant][:full_name].to_s
  puts "Partial registration completed by #{@last_transient_name}"
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
  @world.journey.home_page.accept_cookies
end

When("I select the option to change details") do
  @world.journey.registration_type_page.submit(start_option: :edit_registration)
end

When("I select the option to deregister or update details") do
  @world.journey.registration_type_page.submit(start_option: :edit_registration)
end

Then("I will be asked to enter my waste registration number") do
  expect(page).to have_text("Enter your waste exemption registration number")
end

Then("I will be advised to contact the EA") do
  expect(page).to have_text("Contact the Environment Agency")
  expect(page).to have_text("You'll need to contact the Environment Agency")
end

Then("my phone number is used for the contact phone number") do
  expect(@world.journey.check_details_page.applicant_tel.text).to eq(@applicant[:telephone])
  expect(@world.journey.check_details_page.contact_tel.text).to have_text(@applicant[:telephone])
end

Then("my email address is used for the contact email address") do
  expect(@world.journey.check_details_page.applicant_tel.text).to eq(@applicant[:telephone])
  expect(@world.journey.check_details_page.contact_email.text).to have_text(@applicant[:email])
end

Then("my business address is used for the contact address") do
  @contact_address = remove_new_lines_from_address(@world.journey.check_details_page.contact_address.text)
  @business_address = remove_new_lines_from_address(@world.journey.check_details_page.company_address.text)
  expect(@contact_address).to eq(@address)
  expect(@business_address).to eq(@address)
end

Then("my business address is used for the site address") do
  @site_address = remove_new_lines_from_address(@world.journey.check_details_page.site_address.text)
  @business_address = remove_new_lines_from_address(@world.journey.check_details_page.company_address.text)
  expect(@site_address).to eq(@address)
  expect(@business_address).to eq(@address)
end

Then("I have the option to choose business, contact address or choose another address") do
  expect(@business_address).to eq(@world.journey.check_site_address_page.operator_address.text)
  expect(@contact_address).to eq(@world.journey.check_site_address_page.contact_address.text)
  expect(@world.journey.check_site_address_page).to have_different_address
end

When("I enter the registration details") do
  @world.journey.site_grid_reference_page.submit(
    grid_ref: "SD 91402 09578",
    site_details: "test location"
  )
  complete_address(:lookup)
  @applicant = generate_person("applicant@example.com")
  complete_applicant_details(@applicant)
  @world.journey.check_contact_name_page.submit(reuse: :accept)
  @world.journey.contact_position_page.submit(position: @applicant[:position])
  @world.journey.check_contact_phone_page.submit(reuse: :accept)
  @world.journey.check_contact_email_page.submit(reuse: :accept)
  @world.journey.check_contact_address_page.submit(reuse: :accept)
end

When("I confirm the registration details") do
  @world.journey.check_details_page.submit
end

When("I confirm the charge summary") do
  @total_charge = trim_pound_sign(@world.journey.exemptions_summary_page.total_charge.text)
  @world.journey.exemptions_summary_page.submit_button.click
  @world.journey.declaration_page.submit
end

Then("I will see a registration confirmation") do
  expect(@world.journey.registration_confirmation_page.registration_number).to have_text("WEX")
  puts "#{@world.journey.registration_confirmation_page.registration_number.text} generated"
end

When("I select waste activity {string}") do |activity|
  case activity
  when "We use waste in building and construction"
    @world.journey.select_waste_activities_page.submit(building: true)
  when "We burn waste as fuel"
    @world.journey.select_waste_activities_page.submit(burn_fuel: true)
  when "We spread or mix waste"
    @world.journey.select_waste_activities_page.submit(spread_waste: true)
  when "We use waste in manufacturing or for a specified purpose"
    @world.journey.select_waste_activities_page.submit(manufacture: true)
  when "We use effluent or sludge"
    @world.journey.select_waste_activities_page.submit(sludge: true)
  when "We burn plant and wood waste"
    @world.journey.select_waste_activities_page.submit(burn_plant: true)
  when "We deposit spoil, sanitary and plant matter waste"
    @world.journey.select_waste_activities_page.submit(spoil: true)
  when "We deposit or store waste samples for testing"
    @world.journey.select_waste_activities_page.submit(deposit_testing: true)
  when "We chemically treat, wash waste or use anaerobic digestion"
    @world.journey.select_waste_activities_page.submit(wash: true)
  when "We crush, bale, shred or chip waste"
    @world.journey.select_waste_activities_page.submit(crush: true)
  when "We sort, blend and recover waste"
    @world.journey.select_waste_activities_page.submit(sort: true)
  when "We treat waste using a wormery or by composting"
    @world.journey.select_waste_activities_page.submit(worms: true)
  when "We store waste"
    @world.journey.select_waste_activities_page.submit(store: true)
  end
end

Given("I select exemption(s) {string} from the activities list") do |exemptions|
  @world.journey.select_waste_activities_page.submit_button.click
  @existing_exemptions = []
  exemptions.split.each do |ex|
    @existing_exemptions << ex
  end
  @world.journey.choose_exemptions_page.submit(exemptions: exemptions.split,
                                               beta: true)
end

Given("I select exemption(s) {string} from the list") do |exemptions|
  exemptions.split.each do |ex|
    @existing_exemptions << ex
  end

  @world.journey.choose_exemptions_page.submit(exemptions: exemptions.split)
end

Given("I confirm my waste activities are {string} on a farm") do |choice|
  case choice
  when "not"
    @world.journey.on_farm_page.submit(on_farm: false)
    @world.journey.farmer_page.submit(farmer: false)
  when "on"
    @world.journey.on_farm_page.submit(on_farm: :on_farm)
    @world.journey.farmer_page.submit(farmer: :farmer)
  end
end

Given("I enter my business details") do
  complete_organisation_details(generate_registration(:individual))
end

Given("I enter my business details for a {string}") do |business|
  complete_organisation_details(generate_registration(business.to_sym))
end
