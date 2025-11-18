# frozen_string_literal: true

When("I deregister individual exemptions") do
  @world.bo.sites_page.sites.first.exemptions_link.click
  # Count the number of deregister links and active, ceased and revoked items
  @no_of_dereg_links = @world.bo.exemptions_page.deregister_ex_links.count
  @no_of_active_tags = @world.bo.exemptions_page.active_tags.count
  @no_of_ceased_tags = @world.bo.exemptions_page.ceased_tags.count
  @no_of_revoked_tags = @world.bo.exemptions_page.revoked_tags.count

  # Count how many have been revoked or ceased this step:
  @no_revoked = 0
  @no_ceased = 0

  # Deregister 2 exemptions, choosing randomly between revoking or ceasing.

  2.times do

    # Click the first 'deregister exemption' link. There should be at least 3 from the background:
    @world.bo.exemptions_page.deregister_ex_links.first.click
    expect(@world.bo.exemptions_page.heading).to have_text("Deregister Exemption")
    expect(@world.bo.exemptions_page.heading).to have_text("for Registration #{@world.last_reg_no}")

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
      reason: "I decided I didn't like this exemption at: #{Time.new.inspect}"
    )
    @world.bo.registration_details_page.sites.click
    @world.bo.sites_page.sites.first.exemptions_link.click
  end
  puts "#{@world.last_reg_no} partially deregistered"
end

Then("the exemptions are no longer active") do
  # Compare the number of items on screen to before to check that the statuses are correct.
  expect(@world.bo.exemptions_page.deregister_ex_links.count).to eq(@no_of_dereg_links - 2)
  expect(@world.bo.exemptions_page.active_tags.count).to eq(@no_of_active_tags - @no_revoked - @no_ceased)
  expect(@world.bo.exemptions_page.revoked_tags.count).to eq(@no_of_revoked_tags + @no_revoked)
  expect(@world.bo.exemptions_page.ceased_tags.count).to eq(@no_of_ceased_tags + @no_ceased)
end

When("I deregister a whole registration") do
  @world.bo.dashboard_page.admin_menu.home_page.click
  # Search for the last reference number
  @world.bo.dashboard_page.submit(search_term: @world.last_reg_no)
  find_link("View details").click
  expect(@world.bo.registration_details_page.heading).to have_text("registration details for #{@world.last_reg_no}")
  @world.bo.registration_details_page.deregister_reg_link.click
  # rubocop:disable Layout/LineLength
  expect(@world.bo.deregister_page.heading).to have_text("Deregister all active Exemptions for Registration #{@world.last_reg_no}")
  # rubocop:enable Layout/LineLength

  @world.bo.deregister_page.cease_radio.click
  @reg_status = "ceased"

  # Specify reason for revoking:
  @world.bo.deregister_page.submit(
    reason: "Whole registration deregistered"
  )
  puts "#{@world.last_reg_no} fully #{@reg_status}"
end

Then("the registration is no longer active") do
  # Check that there are no deregister links or active tags
  expect(@world.bo.registration_details_page).to have_no_deregister_reg_link
  @world.bo.registration_details_page.back_link.click
  @world.bo.dashboard_page.submit(search_term: @world.last_reg_no)
  if @reg_status == "ceased"
    expect(@world.bo.dashboard_page).to have_ceased_tag
  else
    expect(@world.bo.dashboard_page).to have_revoked_tag
  end
end

When("I {string} an exemption") do |deregistration_type|
  # Last registration number is stored in @world.last_reg_no.
  # Search for the last reference number:
  @world.bo.dashboard_page.admin_menu.home_page.click
  @world.bo.dashboard_page.submit(search_term: @world.last_reg_no)
  find_link("View details").click
  @world.bo.registration_details_page.sites.click
  @world.bo.sites_page.sites.first.exemptions_link.click

  @exemption = @world.bo.exemptions_page.exemption_details.first.exemption.text

  @world.bo.exemptions_page.deregister_ex_links.first.click
  @deregistration_type = deregistration_type
  if deregistration_type == "cease"
    @world.bo.deregister_page.cease_radio.click
    @deregistration_reason = "Ceased by user, no longer needed"
  else
    @world.bo.deregister_page.revoke_radio.click
    @deregistration_reason = "Revoked on advice from area"
  end
  @world.bo.deregister_page.submit(
    reason: @deregistration_reason
  )
end

Then("I can see the deregistration details from the site's exemptions page") do
  @world.bo.dashboard_page.admin_menu.home_page.click
  @world.bo.dashboard_page.submit(search_term: @world.last_reg_no)
  find_link("View details").click
  @world.bo.registration_details_page.sites.click
  @world.bo.sites_page.sites.first.exemptions_link.click
  @world.bo.exemptions_page.deregistration_details.first.click
  log = @world.bo.deregistration_details_page.log_details(@exemption)
  expect(log.reason).to have_text(@deregistration_reason)
  expect(log.status).to have_text(@deregistration_type)
end

Then("each site has been deregistered") do
  find_link("View details").click
  @world.bo.registration_details_page.sites.click

  while @world.bo.sites_page.has_next_page?
    @world.bo.sites_page.sites.each do |site|
      expect(site).to have_no_deregister_link
      expect(site.site_status.text).to eq("deregistered")
    end
    @world.bo.sites_page.next_page.click if @world.bo.sites_page.has_next_page?
  end
end

When("I deregister a site") do
  @world.bo.dashboard_page.admin_menu.home_page.click
  # Search for the last reference number
  @world.bo.dashboard_page.submit(search_term: @world.last_reg_no)
  find_link("View details").click
  @world.bo.registration_details_page.sites.click
  @world.bo.sites_page.sites.first.deregister_link.click
end

Then("the site is no longer active") do
  expect(@world.bo.sites_page.sites.first.site_status.text).to eq("deregistered")
end

When("I {string} a site") do |deregistration_type|
  @world.bo.dashboard_page.admin_menu.home_page.click
  # Search for the last reference number
  @world.bo.dashboard_page.submit(search_term: @world.last_reg_no)
  find_link("View details").click
  @world.bo.registration_details_page.sites.click
  @world.bo.sites_page.sites.first.deregister_link.click
  @deregistration_type = deregistration_type
  if deregistration_type == "cease"
    @world.bo.deregister_page.cease_radio.click
    @deregistration_reason = "Ceased by user, site no longer active"
  else
    @world.bo.deregister_page.revoke_radio.click
    @deregistration_reason = "Revoked by enforcement, site shut down"
  end
  @world.bo.deregister_page.submit(
    reason: @deregistration_reason
  )
end

When("I {string} an exemption on a site") do |deregistration_type|
  @world.bo.dashboard_page.admin_menu.home_page.click
  # Search for the last reference number
  @world.bo.dashboard_page.submit(search_term: @world.last_reg_no)
  find_link("View details").click
  @world.bo.registration_details_page.sites.click
  @world.bo.sites_page.sites.first.exemptions_link.click
  @exemption = @world.bo.exemptions_page.exemption_details.first.exemption.text
  @deregistration_type = deregistration_type
  @world.bo.exemptions_page.deregister_ex_links.first.click
  if deregistration_type == "cease"
    @world.bo.deregister_page.cease_radio.click
    @deregistration_reason = "Ceased by user, exemption no longer needed"
  else
    @world.bo.deregister_page.revoke_radio.click
    @deregistration_reason = "Revoked by area team on advice"
  end
  @world.bo.deregister_page.submit(
    reason: @deregistration_reason
  )
end

Then("the registration remains active") do
  @world.bo.dashboard_page.admin_menu.home_page.click
  # Search for the last reference number
  @world.bo.dashboard_page.submit(search_term: @world.last_reg_no)
  expect(@world.bo.dashboard_page).to have_active_tag
end

Then("each exemption on the site has been {string}") do |status|
  @world.bo.sites_page.sites.first.exemptions_link.click
  @world.bo.exemptions_page.exemption_details.each do |exemption|
    expect(exemption.exemption_status.text).to eq(status)
  end
end

Then("the exemption on the site has been {string}") do |status|
  @world.bo.registration_details_page.sites.click
  @world.bo.sites_page.sites.first.exemptions_link.click
  expect(@world.bo.exemptions_page.exemption_details.last.exemption_status.text).to eq(status)
end

Then("the site remains active") do
  @world.bo.exemptions_page.back_link.click
  expect(@world.bo.sites_page.sites.first.site_status.text).to eq("active")
end
