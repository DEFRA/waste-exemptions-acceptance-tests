# frozen_string_literal: true

Given("my business is a {string}") do |business|
  @world.current_reg = generate_registration(business.to_sym)
end

Then("I register an exemption") do
  @world.last_reference = add_submitted_registration(@world.current_reg, true, "random", "random")
end

Then("I will be informed the registration is complete") do
  expect(page).to have_content "Registration complete"
end
