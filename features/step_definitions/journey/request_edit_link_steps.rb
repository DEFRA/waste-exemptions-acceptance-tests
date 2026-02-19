# frozen_string_literal: true

edit_link_email_expected_text =
  "Update your details or deregister your waste exemptions"

When("I start the flow to request an edit link") do
  @world.journey.home_page.load
  @world.journey.home_page.accept_cookies
  @world.journey.registration_type_page.submit(start_option: :edit_registration)
end

When("I enter an invalid combination of reference number and email address") do
  @world.journey.capture_reference_page.submit(reference: @registration)
  @world.journey.capture_email_page.submit(contact_email: "nonsense@example.foo")
end

Then("I will see the standard conditional confirmation page") do
  expect(page).to have_content "If your email address is in our system we'll send you a link to your registration page."
end

Then("I will not receive an edit link email") do
  expect(email_exists?([@world.last_reg_no, edit_link_email_expected_text], @world.last_reg)).to be false
end

When("I enter a valid combination of reference number and email address") do
  @world.journey.capture_reference_page.submit(reference: @world.last_reg_no)
  @world.journey.capture_email_page.submit(contact_email: "contact1@example.com")
end

Then("I will receive an edit link email") do
  expect(email_exists?([@world.last_reg_no, edit_link_email_expected_text], @world.last_reg)).to be true
end
