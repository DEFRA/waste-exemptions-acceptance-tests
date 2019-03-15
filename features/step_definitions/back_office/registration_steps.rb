# frozen_string_literal: true

Then("I complete a limited companies registration") do
  @world.bo.dashboard_page.create_new_registration.click

  @world.current_reg = generate_registration(:limited)

  # Stores the exemption number so the exemption can be edited in later steps
  @world.last_reference = add_submitted_registration(@world.current_reg)
end

Then("I complete a partnerships registration") do
  @world.bo.dashboard_page.create_new_registration.click

  @world.current_reg = generate_registration(:partnership)

  # Stores the exemption number so the exemption can be edited in later steps
  @world.last_reference = add_submitted_registration(@world.current_reg)
end
