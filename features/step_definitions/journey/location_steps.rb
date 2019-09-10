# frozen_string_literal: true

Then("I start a new waste exemption registration") do
  @world.journey.home_page.load
  @world.journey.registration_type_page.submit(start_option: :new_radio)
end

Then("I choose locations outside England") do
  # Select Wales:
  @world.journey.location_page.submit(location: :wales)
  non_england_page = @world.journey.standard_page
  expect(non_england_page.heading).to have_text("You cannot register your exemptions here")
  expect(non_england_page.content).to have_text("you need to register with Natural Resources Wales")
  find_link("Register your waste exemptions (Wales)").click
  # Include a sleep here, to allow time to load the right page and check the correct title:
  sleep(5)
  # Update the title here once we have fixed the links in RUBY-647.
  # This may point to the "choose language" page or NRW's waste exemption pages.
  expect(page.title).to include("Natural Resources Wales")
  page.evaluate_script("window.history.back()")
  non_england_page.back_link.click

  # Select Scotland:
  @world.journey.location_page.submit(location: :scotland)
  expect(non_england_page.heading).to have_text("You cannot register your exemptions here")
  expect(non_england_page.content).to have_text("register with the Scottish Environment Protection Agency (SEPA)")
  find_link("Register your waste exemptions (Scotland)").click
  sleep(5)
  expect(page.title).to include("Activities exempt from waste management licensing")
  page.evaluate_script("window.history.back()")
  non_england_page.back_link.click

  # Select Northern Ireland:
  @world.journey.location_page.submit(location: :northern_ireland)
  expect(non_england_page.heading).to have_text("You cannot register your exemptions here")
  expect(non_england_page.content).to have_text("register with the Northern Ireland Environment Agency (NIEA)")
  find_link("Register your waste exemptions (Northern Ireland)").click
  sleep(5)
  expect(page.title).to include("Waste management licence (Northern Ireland)")
  page.evaluate_script("window.history.back()")
  non_england_page.back_link.click

end

Then("I will be advised to register with another authority") do
  # No action - all assertions are covered in last step
end
