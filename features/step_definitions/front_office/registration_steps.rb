# frozen_string_literal: true

Then("I am an individual") do
  @world.current_reg = generate_registration(:individual)
end

Then("I am a partnership") do
  @world.current_reg = generate_registration(:partnership)
end

Then("I am a limited company") do
  @world.current_reg = generate_registration(:limited)
end

Then("I register an exemption") do
  @world.last_reference = add_submitted_registration(@world.current_reg)
end

Then("I will be informed the registration is complete") do
  expect(page).to have_content "Registration complete"
end
