# frozen_string_literal: true

Then("I start a new waste exemption registration") do
  @world.journey.home_page.load
  @world.journey.registration_type_page.submit(start_option: :new_radio)
end

Then("I choose Wales") do
  @world.journey.location_page.submit(location: :wales)
end

Then("I will be advised to register with Natural Resources Wales") do
  expect(@world.journey.register_in_wales_page).to have_text(
    "In Wales you need to register with Natural Resources Wales"
  )
end
