Given(/^I choose Wales$/) do
  @app.location_page.submit(location: :wales)
end

Then(/^I will be advised to register with Natural Resources Wales$/) do
  expect(@app.register_in_wales_page).to have_text("In Wales you need to register with Natural Resources Wales")
end
