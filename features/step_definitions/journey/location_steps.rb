# frozen_string_literal: true

Then("I start a new waste exemption registration") do
  @world.journey.home_page.load
  @world.journey.registration_type_page.submit(start_option: :new_radio)
end

Then("I choose locations outside England") do
  # Select Wales:
  @world.journey.location_page.submit(location: :wales)

  expect(page).to have_text("You cannot register your exemptions here")
  expect(page).to have_text("you need to register with Natural Resources Wales")

  @world.journey.location_page.back_link.click

  # Select Scotland:
  @world.journey.location_page.submit(location: :scotland)
  expect(page).to have_text("You cannot register your exemptions here")
  expect(page).to have_text("register with the Scottish Environment Protection Agency (SEPA)")

  @world.journey.location_page.back_link.click

  # Select Northern Ireland:
  @world.journey.location_page.submit(location: :northern_ireland)
  expect(page).to have_text("You cannot register your exemptions here")
  expect(page).to have_text("register with the Northern Ireland Environment Agency (NIEA)")

  @world.journey.location_page.back_link.click

end

Then("I will be advised to register with another authority") do
  # No action - all assertions are covered in last step
end
