# frozen_string_literal: true

Given "I register and test validation and accessibility" do
  # This step checks validation throughout the journey as well as testing the main pages for accessibility.

  # add_submitted_registration
  @world.journey.home_page.load
  @world.journey.home_page.accept_cookies
  reg = @world.last_reg # shorthand for the registration data that has been generated

  # Start page
  @world.journey.registration_type_page.submit_button.click
  expect(@world.journey.registration_type_page.error).to have_text("You must answer this question")
  check_for_accessibility
  @world.journey.registration_type_page.submit(start_option: :new_radio)

  # Location page
  @world.journey.location_page.submit
  expect(@world.journey.location_page.error).to have_text("You must answer this question")
  check_for_accessibility
  @world.journey.location_page.submit(location: :england)

  # # Extra check that going back doesn't trigger a 404 error, based on RUBY-562
  # page.evaluate_script("window.history.back()")
  # expect(@world.journey.location_page.heading).to have_text("In which country will you use the exemptions?")
  # check_for_accessibility
  # @world.journey.location_page.submit(location: :england)

  test_journey_validations(reg, "new")

end

Given "I renew and test validation and accessibility" do

  # Renew with or without changes screen:
  expect(@world.journey.renew_choice_page.heading).to have_text("Do you want to renew with these details?")
  # TODO: check if using mulch should be removed
  expect(@world.journey.renew_choice_page.content).to have_text("U12")
  @world.journey.renew_choice_page.submit
  # TODO: add back check
  expect(@world.journey.renew_choice_page.error).to have_text("Select if you want to renew with these details")
  check_for_accessibility

  # Firstly, select 'no changes':
  @world.journey.renew_choice_page.renew_without_changes_radio.click
  @world.journey.renew_choice_page.submit
  expect(@world.journey.renew_splash_page.heading).to have_text("You are about to renew for 3 years")
  check_for_accessibility

  # Go back and select 'with changes'
  @world.journey.renew_splash_page.back_link.click
  @world.journey.renew_choice_page.renew_with_changes_radio.click
  @world.journey.renew_choice_page.submit

  # Generate data for the renewed registration:
  @renewed_reg = generate_registration(:limited_company, nil)
  @changes = "with"

  expect(@world.journey.renew_splash_page.heading).to have_text("We'll fill in the form")
  check_for_accessibility
  @world.journey.renew_splash_page.submit

  # Location page. Can't generate an error here because a value is prepropulated.
  @world.journey.location_page.submit(location: :england)

  # This function tests the rest of the journey, where the functionality is shared with new registrations:
  test_journey_validations(@renewed_reg, "renew")

end

Then "I see the renewal confirmation screen" do

  expect(@world.journey.confirmation_page.confirmation_box).to have_text("You have renewed your exemptions")
  check_for_accessibility
  @renewed_reg_no = @world.journey.confirmation_page.ref_no.text
  puts @world.last_reg_no + " renewed with changes. New registration is " + @renewed_reg_no + "."

end
