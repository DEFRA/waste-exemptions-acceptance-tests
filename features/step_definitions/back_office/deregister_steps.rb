# frozen_string_literal: true

When("I deregister individual exemptions") do
  # Last registration number is stored in @world.last_reference.
  # Search for the last reference number:
  @world.bo.dashboard_page.submit(search_term: @world.last_reference)
  find_link("View details").click
  expect(@world.bo.registration_details_page.heading).to have_text("Registration details for " + @world.last_reference)

  # Count the number of deregister links and active, ceased and revoked items
  @no_of_dereg_links = @world.bo.registration_details_page.deregister_ex_links.count
  @no_of_active_tags = @world.bo.registration_details_page.active_tags.count
  @no_of_ceased_tags = @world.bo.registration_details_page.ceased_tags.count
  @no_of_revoked_tags = @world.bo.registration_details_page.revoked_tags.count

  # Count how many have been revoked or ceased this step:
  @no_revoked = 0
  @no_ceased = 0

  # Deregister 3 exemptions, choosing randomly between revoking or ceasing.
  3.times do

    # Click the first 'deregister exemption' link. There should be at least 3 from the background:
    @world.bo.registration_details_page.deregister_ex_links.first.click
    expect(@world.bo.deregister_page.heading).to have_text("Deregister Exemption")
    expect(@world.bo.deregister_page.heading).to have_text("for Registration " + @world.last_reference)

    # Randomly decide whether to revoke or cease:
    if rand(0..1).zero?
      @world.bo.deregister_page.revoke_radio.click
      @no_revoked += 1
    else
      @world.bo.deregister_page.cease_radio.click
      @no_ceased += 1
    end

    # Specify a reason for revoking:
    @world.bo.deregister_page.submit(
      reason: "I decided I didn't like this exemption at: " + Time.new.inspect
    )
  end
  puts @world.last_reference + " partially deregistered"
end

Then("the exemptions are no longer active") do
  # Compare the number of items on screen to before to check that the statuses are correct.
  expect(@world.bo.registration_details_page.deregister_ex_links.count).to eq(@no_of_dereg_links - 3)
  expect(@world.bo.registration_details_page.active_tags.count).to eq(@no_of_active_tags - @no_revoked - @no_ceased)
  expect(@world.bo.registration_details_page.revoked_tags.count).to eq(@no_of_revoked_tags + @no_revoked)
  expect(@world.bo.registration_details_page.ceased_tags.count).to eq(@no_of_ceased_tags + @no_ceased)
end

When("I deregister a whole registration") do
  # Search for the last reference number
  @world.bo.dashboard_page.submit(search_term: @world.last_reference)
  find_link("View details").click
  expect(@world.bo.registration_details_page.heading).to have_text("Registration details for " + @world.last_reference)
  @world.bo.registration_details_page.deregister_reg_link.click
  # rubocop:disable Metrics/LineLength
  expect(@world.bo.deregister_page.heading).to have_text("Deregister all active Exemptions for Registration " + @world.last_reference)
  # rubocop:enable Metrics/LineLength

  # Randomly revoke or cease the whole registration:
  if rand(0..1).zero?
    @world.bo.deregister_page.revoke_radio.click
  else
    @world.bo.deregister_page.cease_radio.click
  end

  # Specify reason for revoking:
  @world.bo.deregister_page.submit(
    reason: "I decided I didn't like this registration at: " + Time.new.inspect
  )
  puts @world.last_reference + " fully deregistered"
end

Then("the registration is no longer active") do
  # Check that there are no deregister links or active tags
  expect(@world.bo.registration_details_page).to have_no_deregister_reg_link
  expect(@world.bo.registration_details_page.deregister_ex_links.count.zero?).to eq(true)
  expect(@world.bo.registration_details_page.active_tags.count.zero?).to eq(true)
end

Then("I cannot deregister anything") do
  @world.bo.dashboard_page.submit(search_term: @world.last_reference)
  find_link("View details").click

  # Check that there are no deregister links and at least one active tag:
  expect(@world.bo.registration_details_page.heading).to have_text("Registration details for " + @world.last_reference)
  expect(@world.bo.registration_details_page).to have_no_deregister_reg_link
  expect(@world.bo.registration_details_page.deregister_ex_links.count.zero?).to eq(true)
  expect(@world.bo.registration_details_page.active_tags.count.positive?).to eq(true)
end
